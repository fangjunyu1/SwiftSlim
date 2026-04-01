# Shranjevanje zneska v hranilniku

V prejšnji lekciji smo izdelali preprost »hranilnik«. V tej lekciji se bomo naučili, kako znesek v »hranilniku« trajno shraniti.

V tej lekciji bomo predvsem spoznali UserDefaults in ovoj lastnosti @AppStorage, obenem pa bomo dodatno razložili delovanje onAppear ter uporabo opcijskega tipa (nil).

Pomembno je poudariti, da ta lekcija nadaljuje kodo »hranilnika«, ki smo jo razvili v prejšnji lekciji.

## Težava s trajnim shranjevanjem

Zdaj je vmesnik našega »hranilnika« zelo preprost in tudi priročen za uporabo.

![Piggy Bank](../../Resource/014_view.png)

Vendar obstaja očitna težava: vsakič, ko se pogled osveži ali ko aplikacijo znova odpremo, se skupni znesek v hranilniku vrne na 0, vsi prej shranjeni zneski pa izginejo.

To pomeni, da podatki niso zares shranjeni. Povedano drugače: naš trenutni »hranilnik« lahko hrani le začasne podatke.

### Zakaj se podatki ne shranijo trajno?

To je zato, ker uporabljamo spremenljivko, deklarirano z @State:

```swift
@State private var amount = 0
```

Življenjski cikel spremenljivke, deklarirane z @State, je popolnoma odvisen od pogleda.

Ko se pogled ustvari, se amount inicializira na 0; ko se pogled uniči, se uniči tudi amount.

Podatki, shranjeni v amount, obstajajo samo v pomnilniku in niso zapisani v napravo.

Ker ne želimo, da je amount vezan na življenjski cikel pogleda, moramo uvesti trajno shranjevanje podatkov. Z drugimi besedami, podatke moramo shraniti v napravo.

### Kaj pomeni »trajna hramba podatkov«

Trajno shranjevanje podatkov lahko razumemo kot prenos podatkov iz »začasnega pomnilnika« v »shrambo naprave«.

Ko zapremo pogled ali aplikacijo, se podatki ne izgubijo.

Pri razvoju v Swiftu lahko za preprosto »trajno shranjevanje« uporabimo UserDefaults, za bolj kompleksne podatke pa SwiftData ali CoreData.

V tej lekciji bomo najprej spoznali najpreprostejšo možnost: UserDefaults.

## UserDefaults

UserDefaults se uporablja za shranjevanje lahkih podatkov v obliki parov ključ-vrednost in se pogosto uporablja za shranjevanje osnovnih tipov, kot so String, Int, Double in Bool.

### Shranjevanje podatkov

UserDefaults uporablja metodo set za shranjevanje podatkov:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

Prvi parameter v UserDefaults predstavlja podatke, ki jih shranjujemo; tukaj posredujemo podatke tipa String, Int in podobno.

Drugi parameter forKey je podoben imenu spremenljivke in se uporablja za označevanje podatkov, shranjenih v UserDefaults.

### Branje podatkov

UserDefaults uporablja ustrezne metode za branje podatkov:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Pri branju moramo uporabiti metodo, ki ustreza pravemu tipu, sicer lahko pride do napak ali nepravilnih podatkov.

### Pomembne opombe glede UserDefaults

#### 1. Vrne opcijski tip

Pri branju podatkov iz UserDefaults nekatere metode vrnejo opcijski tip (Optional).

Na primer:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

Vrnjeni tip za name je:

```swift
String?
```

To pomeni, da lahko vrednost obstaja ali pa tudi ne.

**Zakaj se vrne opcijski tip?**

Zato, ker v UserDefaults določen ključ morda sploh nima pripadajočih podatkov.

Na primer:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Če ključ "City" prej še nikoli ni bil shranjen, bo rezultat branja:

```swift
nil
```

Pomembno je poudariti, da nil pomeni, da podatka ni, in ne praznega niza.

V lekciji o »tipnem sistemu« smo se srečali s podobno situacijo: ko pretvorba tipa ne uspe, se vrne opcijski tip.

Takrat moramo uporabiti ?? in podati privzeto vrednost za razpakiranje:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Če UserDefaults najde podatke, uporabi prebrano vrednost; če podatkov ne najde (nil), uporabi privzeto vrednost.

#### 2. Vrne neopcijski tip

Ko UserDefaults bere tipe Int, Double in Bool, vrne neopcijski tip.

Na primer:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Tudi če za te ključe nikoli ni bilo shranjenih podatkov, vrnjena vrednost ne bo nil.

Namesto tega se vrne privzeta vrednost:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Omejitev količine podatkov

UserDefaults je primeren le za shranjevanje manjše količine podatkov, na primer nastavitev aplikacije ali preprostih stanj.

V praksi ni primeren za shranjevanje večjih količin podatkov ali podatkov, ki se zelo pogosto berejo in zapisujejo.

## Shranjevanje zneska v »hranilniku«

Zdaj lahko z uporabo UserDefaults implementiramo logiko za shranjevanje skupnega zneska v »hranilniku«.

Ko uporabnik pritisne gumb, se vneseni znesek prišteje skupnemu znesku, nato pa se skupni znesek shrani v UserDefaults.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

S tem smo zdaj implementirali logiko zapisovanja podatkov.

## Razlaga logike trajnega shranjevanja

Čeprav smo že zaključili zapisovanje podatkov za trajno shranjevanje, bomo pri dejanskem zagonu opazili, da je ob vsakem osveževanju pogleda ali ponovnem odpiranju aplikacije spremenljivka amount še vedno 0.

To je zato, ker:

```swift
@State private var amount = 0
```

V SwiftUI se spremenljivka @State ob ustvarjanju pogleda znova inicializira.

Čeprav je vrednost amount že shranjena v UserDefaults, se ob ponovnem nalaganju pogleda amount še vedno ponastavi na 0.

To pomeni, da smo trenutno podatke samo zapisali v UserDefaults, nismo pa jih obnovili v pogledu.

Zato moramo ob nalaganju pogleda še ročno prebrati vrednost iz UserDefaults in jo znova dodeliti spremenljivki amount, da celotna logika trajnega shranjevanja res deluje.

### Logična primerjava

Ta proces si lahko predstavljamo kot »šolsko tablo v učilnici«:

Med poukom učitelj piše vsebino na tablo; ta vsebina je podobna trenutnemu stanju v pogledu (@State).

Ko je ure konec, tablo obrišejo, da pripravijo prostor za naslednjo uro. To ustreza uničenju pogleda, pri čemer se izbrišejo tudi podatki v @State.

Da se učna vsebina ne izgubi, jo učitelj prej shrani v učni material. Ta učni material je podoben podatkom, shranjenim v UserDefaults.

Ko se naslednjič pouk znova začne, je tabla na začetku prazna (inicializacija @State), zato mora učitelj na podlagi učnega materiala prejšnjo vsebino znova napisati na tablo (prebrati UserDefaults).

Pomembno je razumeti, da tabla sama od sebe ne obnovi prejšnje vsebine; to je mogoče le z »branjem učnega materiala« (branjem UserDefaults) in ponovnim zapisom.

## Uporaba onAppear za branje podatkov

Ko se pogled prikaže, moramo ročno prebrati vrednost iz UserDefaults in jo dodeliti spremenljivki amount v @State, da dosežemo pravo trajno shranjevanje podatkov.

V SwiftUI lahko za izvajanje inicializacijske logike ob prikazu pogleda uporabimo onAppear:

```swift
.onAppear {}
```

Kodo za branje iz UserDefaults postavimo v onAppear:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Ko se pogled ustvari, se amount inicializira na 0; ko se pogled prikaže, se sproži onAppear, ki prebere shranjeno vrednost iz UserDefaults in jo dodeli spremenljivki amount. Tako lahko pogled prikaže zadnji shranjeni znesek.

S tem je celotna logika trajnega shranjevanja podatkov za »hranilnik« zaključena.

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
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Ovoj lastnosti @AppStorage

SwiftUI ponuja ovoj lastnosti @AppStorage, ki lahko poenostavi logiko shranjevanja z uporabo UserDefaults.

```swift
@AppStorage("amount") private var amount = 0
```

@AppStorage je ovoj za UserDefaults, pri katerem "amount" ustreza ključu v UserDefaults.

Ko se pogled ustvari, se podatki preberejo iz UserDefaults; ko se vrednost spremeni, se samodejno zapiše nazaj v UserDefaults.

Podpira mehanizem posodabljanja stanja v SwiftUI in, podobno kot @State, ob spremembi osveži pogled SwiftUI.

To pomeni, da lahko z @AppStorage izvedemo tako branje kot shranjevanje podatkov, brez ročnega klica UserDefaults in brez uporabe onAppear za ročno obnovo podatkov.

Zato lahko v kodi UserDefaults nadomestimo z @AppStorage:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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

## Povzetek

V tej lekciji smo se naučili naslednje:

Najprej smo spoznali, da UserDefaults služi za shranjevanje lahkih podatkov. Z njim smo skupni znesek shranili v napravo. UserDefaults omogoča metode za branje in zapisovanje podatkov, pri čemer moramo znati obravnavati tudi opcijske tipe.

Nato smo razumeli, da je @State namenjen le upravljanju začasnega stanja v pogledu in da je njegov življenjski cikel vezan na pogled. Ko se pogled znova ustvari, se @State znova inicializira.

Pri obnovi podatkov iz UserDefaults smo se naučili uporabiti onAppear za branje podatkov ob prikazu pogleda in s tem dokončati obnovo stanja.

Na koncu smo uporabili @AppStorage kot zamenjavo za UserDefaults, da se podatki ob nalaganju pogleda samodejno preberejo, ob spremembi vrednosti pa samodejno zapišejo, s čimer odpade potreba po ročnem klicu UserDefaults in onAppear.

S tem znanjem lahko izvedemo osnovno shranjevanje podatkov v aplikaciji, tako da se podatki trajno ohranijo.

## Vaja po lekciji

Zdaj »hranilnik« podpira shranjevanje zneska, vendar funkcionalnost še ni popolna.

1. Kadar želi uporabnik dvigniti denar, je treba zasnovati ustrezno logiko za odvzem zneska.
2. Kadar želi uporabnik celoten znesek izprazniti, je treba implementirati tudi logiko ponastavitve.
3. Če želimo hranilniku dodati ime, moramo uvesti tudi shranjevanje podatkov tipa String.

Na tej osnovi lahko te funkcije dopolniš in tako narediš »hranilnik« bolj popoln.

## Dodatno znanje – težava s privzeto vrednostjo v vnosnem polju

Zdaj lahko dodatno izboljšamo interakcijo z vnosnim poljem, da bo vnos bolj priročen.

![textfield](../../Resource/015_view.png)

V trenutni izvedbi je privzeta vrednost v vnosnem polju 0. To pomeni, da mora uporabnik ob vsakem vnosu zneska najprej izbrisati 0 in šele nato vnesti novo številko, kar ni dobra uporabniška izkušnja.

Bolj pravilno je, da je vnosno polje na začetku prazno in ne 0.

To je zato, ker sta TextField in number medsebojno dvosmerno povezana:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Ko je number inicializiran na 0, bo tudi vnosno polje prikazovalo 0.

Zato moramo number spremeniti v prazno vrednost, torej nil.

```swift
@State private var number = nil
```

Takrat se pojavi napaka:

```swift
Generic parameter 'Value' could not be inferred
```

To je točno situacija, o kateri smo govorili v lekciji o »tipnem sistemu«: kadar spremenljivka ne more biti samodejno tipovno določena, moramo tip navesti eksplicitno.

Ker smo number nastavili na nil, nil sam po sebi ne vsebuje nobene tipne informacije, zato prevajalnik ne more vedeti, ali gre za String, Int ali kak drug tip, in zato javi napako.

Zato moramo za number izrecno navesti tip:

```swift
@State private var number:Int? = nil
```

Tukaj Int? pomeni opcijski tip (Optional), kar pomeni, da je number lahko Int ali pa nil.

Na ta način lahko ob inicializaciji uporabimo nil, zaradi česar bo vnosno polje prazno in ne bo prikazovalo 0.

### Razpakiranje opcijskega tipa

Ko number spremenimo v opcijski tip, bo obstoječa koda za izračun javila napako:

```swift
amount += number
```

Opozorilo je:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

To je zato, ker je number zdaj lahko nil. Če bi ga neposredno uporabili v izračunu, bi to pomenilo:

```swift
amount += nil
```

Očitno se nil ne more prišteti k amount, zato takšna operacija ni veljavna.

Zato moramo pri uporabi opcijskega tipa v izračunu najprej izvesti razpakiranje.

Tukaj lahko uporabimo ?? in podamo privzeto vrednost:

```swift
amount += number ?? 0
```

Ko je number nil, se uporabi privzeta vrednost 0; ko ima number vrednost, se uporabi dejanski vneseni podatek.

Tako zagotovimo pravilnost izračuna in hkrati dosežemo, da je vnosno polje privzeto prazno, uporabniku pa ni več treba ročno brisati začetne 0.

## Razširjena koda

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
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
                amount += number ?? 0
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
