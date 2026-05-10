# Prilagajanje videza

V tej lekciji se bomo naučili prilagajanja videza za svetli in temni način.

Na napravah iPhone, iPad in Mac lahko uporabnik izbere svetli ali temni način.

Ko sistem preklopi v temni način, se pri številnih aplikacijah spremenijo tudi barve ozadja, besedila in ikon.

Na primer, čez dan ima lahko vmesnik svetlo ozadje, ponoči pa se lahko spremeni v temno ozadje.

![view](../../../Resource/025_view9.png)

Zmožnost, da se prikaz vmesnika samodejno prilagodi glede na videz sistema, imenujemo prilagajanje videza.

## Predogled prilagajanja videza v Xcode

Preden se naučimo prilagajanja videza, si najprej oglejmo, kako v Xcode predogledamo svetli in temni način.

Na dnu območja `Canvas` kliknite gumb `Device Settings`, da odprete pojavno okno `Canvas Device Settings`.

![canvas](../../../Resource/025_view.png)

V pojavnem oknu lahko vidite nastavitev `Color Scheme`.

![canvas1](../../../Resource/025_view1.png)

Med njimi:

- `Light Appearance` pomeni svetli način.
- `Dark Appearance` pomeni temni način.

Tukaj lahko preklopimo videz predogleda in preverimo, kako je trenutni vmesnik prikazan v svetlem in temnem načinu.

## Vzporedni prikaz obeh videzov

Če želite hkrati videti svetli in temni način, lahko uporabite funkcijo `Variants`.

Na dnu območja `Canvas` kliknite gumb `Variants` in izberite `Color Scheme Variants`.

![canvas2](../../../Resource/025_view2.png)

Po izbiri bo `Canvas` hkrati prikazal predogled svetlega in temnega načina.

![canvas3](../../../Resource/025_view3.png)

Tako lahko lažje primerjamo razlike vmesnika med obema videzoma.

Preprosto povedano:

Če želite samo začasno preklopiti svetli/temni način, lahko uporabite `Canvas Device Settings`.

Če želite hkrati videti oba videza, lahko uporabite `Color Scheme Variants`.

## Pogledi privzeto prilagodijo videz

V SwiftUI se številni sistemski pogledi privzeto samodejno prilagodijo svetlemu in temnemu načinu.

Na primer:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Svetlo")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("nekaj nekaj nekaj")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Prikaz:

![canvas](../../../Resource/025_view4.png)

Vidimo lahko, da sta v svetlem načinu ikona in naslov običajno prikazana v temni barvi.

V temnem načinu se ikona in naslov samodejno spremenita v svetlo barvo.

To je zato, ker pogledi SwiftUI, kot sta `Text` in `Image`, privzeto prilagajajo barve glede na videz sistema.

Z drugimi besedami, če ročno ne določimo fiksne barve, nam SwiftUI pomaga obdelati del prilagajanja videza.

## Fiksne barve se ne zamenjajo samodejno

Pomembno je vedeti, da se barva, ki jo ročno določimo kot fiksno, ne bo samodejno zamenjala glede na svetli/temni način.

Na primer:

```swift
Text("nekaj nekaj nekaj")
	.foregroundStyle(Color.gray)
```

Besedilo je tukaj nastavljeno na `Color.gray`, zato bo vedno prikazano sivo.

Še en primer:

```swift
Text("Naslov")
    .foregroundStyle(Color.white)
```

Ta koda bo v svetlem in temnem načinu vedno prikazala belo besedilo.

Če je tudi ozadje svetlo, belo besedilo morda ne bo jasno vidno.

Zato se pri prilagajanju videza poskusite izogniti poljubnemu zapisovanju fiksnih barv, kot sta `Color.white` in `Color.black`.

V številnih primerih lahko najprej uporabimo sistemske semantične sloge, na primer:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Med njimi:

- `.primary` se običajno uporablja za glavno vsebino.
- `.secondary` se običajno uporablja za sekundarno vsebino.

Samodejno prilagodijo prikaz glede na svetli/temni način.

## Prikaz različne vsebine glede na videz

Včasih ne želimo, da se spremeni samo barva, temveč želimo v različnih videzih prikazati tudi različno vsebino.

Na primer:

- V svetlem načinu prikažemo navadno ikono žarnice.
- V temnem načinu prikažemo svetlečo ikono žarnice.
- V svetlem načinu naslov prikaže `Svetlo`.
- V temnem načinu naslov prikaže `Temno`.

Takrat moramo ugotoviti, ali je trenutni sistem v svetlem ali temnem načinu.

V SwiftUI lahko trenutni videz pridobimo prek okoljske vrednosti `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Celotna koda:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Svetlo" : "Temno"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("nekaj nekaj nekaj")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Prikaz:

![view](../../../Resource/025_view5.png)

Iz predogleda lahko vidimo, da isti pogled v različnih načinih videza ne prikazuje popolnoma enake vsebine.

V svetlem načinu `Image` prikaže navadno ikono žarnice, naslov pa se prikaže kot `Svetlo`.

V temnem načinu `Image` prikaže svetlečo ikono žarnice, naslov pa se prikaže kot `Temno`.

Z drugimi besedami, tukaj se ne spremeni samo barva, temveč se spremenita tudi samo ime ikone in besedilo naslova.

To je zato, ker ikone in naslova nismo zapisali neposredno v `body`, temveč smo glede na `colorScheme` izračunali različno vsebino.

V tej kodi smo uporabili dve izračunani lastnosti:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Svetlo" : "Temno"
}
```

Ko je `colorScheme` enak `.light`, to pomeni, da je trenutno svetli način.

Ko je `colorScheme` enak `.dark`, to pomeni, da je trenutno temni način.

Zato lahko glede na različne načine videza vrnemo različna imena ikon in besedila naslovov.

To je tudi pogosta uporaba izračunanih lastnosti: glede na trenutno stanje izračunamo vsebino, ki jo mora pogled prikazati.

## Razumevanje @Environment

To je naše prvo srečanje z `@Environment`.

`@Environment` lahko razumemo kot: branje vrednosti iz okolja SwiftUI.

Ko se aplikacija izvaja, sistem zagotavlja veliko okoljskih informacij, na primer:

- Trenutni jezik
- Trenutni način videza
- Trenutna smer postavitve
- Trenutna nastavitev velikosti pisave

Ko moramo pridobiti trenutni način videza, lahko preberemo `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Pri tem

```swift
\.colorScheme
```

pomeni, da iz okolja preberemo vrednost `colorScheme`.

```swift
private var colorScheme
```

pomeni, da prebrano vrednost shranimo v spremenljivko `colorScheme`.

Ime spremenljivke lahko določite sami, na primer lahko zapišete tudi:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Dokler je sprednji del `\.colorScheme` nespremenjen, pomeni, da beremo trenutni način videza.

## Dve pogosti vrednosti colorScheme

`colorScheme` ima pogosto dve vrednosti:

```swift
.light
.dark
```

Pomenita:

- `.light`: svetli način
- `.dark`: temni način

Na primer:

```swift
private var titleName: String {
    colorScheme == .light ? "Svetlo" : "Temno"
}
```

Ta koda pomeni:

Če je trenutno svetli način in je `colorScheme == .light` resničen, vrne `"Svetlo"`.

Sicer vrne `"Temno"`.

Zato je v svetlem načinu:

```swift
Text(titleName)
```

prikazano:

```swift
Svetlo
```

V temnem načinu pa je prikazano:

```swift
Temno
```

Na ta način lahko glede na različne videze prikažemo različno vsebino.

## Primer prilagajanja barv

Poleg besedila in ikon moramo včasih tudi sami obdelati prilagajanje barv.

Na primer:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Besedilo")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Prikaz:

![view](../../../Resource/025_view6.png)

V tej kodi je besedilo belo, ozadje pa črno.

V svetlem načinu je črno ozadje precej očitno.

Toda v temnem načinu, če je tudi celotno ozadje vmesnika črno, se to črno ozadje zlije s sistemskim ozadjem in ni videti dovolj jasno.

Takrat lahko glede na način videza preklopimo barvo besedila in barvo ozadja:

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
            Text("Besedilo")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Prikaz:

![view](../../../Resource/025_view7.png)

Zdaj je v svetlem načinu črno ozadje in belo besedilo.

V temnem načinu je belo ozadje in črno besedilo.

Tako imata besedilo in ozadje v katerem koli videzu jasen kontrast, uporabnik pa lahko vsebino jasno vidi.

## Uporaba Assets za prilagajanje barv

Poleg ročnega presojanja s `colorScheme` lahko za prilagajanje svetlemu/temnemu načinu uporabimo tudi barve virov `Assets`.

Ta način je primernejši za upravljanje splošnih barv v aplikaciji.

V projektu Xcode poiščite mapo virov `Assets`.

![assets](../../../Resource/025_color.png)

Odprite mapo `Assets`, z desnim klikom kliknite prazno območje in izberite `New Color Set`, da ustvarite nov barvni vir.

![assets](../../../Resource/025_color1.png)

Tukaj ustvarimo barvo in jo poimenujemo `redText`.

![assets](../../../Resource/025_color2.png)

Barvni vir lahko ločeno nastavi barve za svetli in temni način.

![assets](../../../Resource/025_color3.png)

Ko izberete ustrezno barvno območje, lahko barvo spremenite v inšpektorju atributov na desni strani.

Kliknite gumb `Hide or show the Inspectors` v zgornjem desnem kotu, da odprete območje inšpektorja.

Nato izberite `Show the Attributes inspector`, na dnu poiščite `Show Color Panel` in odprite barvno ploščo.

![assets](../../../Resource/025_color4.png)

Ko kliknete barvo v barvni plošči, se ustrezno barvno območje `redText` sinhrono spremeni.

Tukaj nastavimo `redText` na:

- V svetlem načinu prikaže rdečo barvo
- V temnem načinu prikaže zeleno barvo

![assets](../../../Resource/025_color5.png)

Nazaj v kodi SwiftUI lahko to barvo uporabimo takole:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Pri tem:

```swift
Color("redText")
```

pomeni, da iz `Assets` preberemo barvni vir z imenom `redText`.

Prikaz:

![assets](../../../Resource/025_view8.png)

Vidimo lahko, da isti `Color("redText")` v svetlem in temnem načinu prikaže različne barve.

To kaže, da tudi barve `Assets` same podpirajo prilagajanje videza.

## Razlika med colorScheme in Assets

Tako `colorScheme` kot `Assets` lahko omogočita prilagajanje videza, vendar sta primerna za različne scenarije.

Če želimo samo glede na svetli/temni način preklopiti besedilo, ime slike ali ime `SF Symbols`, lahko uporabimo `colorScheme`.

Na primer:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Če gre za barve, ki se v aplikaciji pogosto uporabljajo, na primer tematsko barvo, barvo ozadja kartice ali barvo besedila, je bolj priporočljivo uporabiti barve `Assets`.

Ker se barve `Assets` lahko ponovno uporabijo v več pogledih, jih je pozneje tudi lažje spreminjati.

Na primer:

```swift
Color("redText")
```

Tako je treba barvo spremeniti samo v `Assets`, vsi kraji, ki uporabljajo to barvo, pa se bodo spremenili skupaj.

## Povzetek

V tej lekciji smo se naučili prilagajanja videza za svetli in temni način.

Najprej smo se naučili, kako v `Canvas` v Xcode predogledamo različne videze, naučili pa smo se tudi, kako z `Color Scheme Variants` hkrati vidimo svetli in temni način.

Nato smo razumeli, da se pogledi SwiftUI, kot sta `Text` in `Image`, privzeto samodejno prilagodijo barvam glede na videz sistema.

Če pa ročno določimo fiksne barve, na primer `Color.white` ali `Color.black`, se te barve ne bodo samodejno zamenjale.

Nato smo se naučili `@Environment` in `colorScheme`:

```swift
@Environment(\.colorScheme) private var colorScheme
```

S pomočjo `colorScheme` lahko presodimo, ali je trenutno svetli ali temni način, ter glede na različne videze prikažemo različne ikone, besedilo ali barve.

Nazadnje smo se naučili barv `Assets`.

Barve `Assets` lahko ločeno nastavijo barve za svetli in temni način ter so primerne za upravljanje splošnih barvnih virov v aplikaciji.

Prilagajanje videza omogoča, da ima aplikacija boljši prikaz podnevi in ponoči, ter lahko prepreči težave, kot sta nejasno besedilo in premalo očitno ozadje.

V dejanskem razvoju je priporočljivo najprej uporabiti privzete prilagoditvene zmožnosti SwiftUI in barve `Assets`.

Ko moramo v različnih videzih preklapljati besedilo, ikone ali slike oziroma obdelati majhno število posebnih prikaznih učinkov, šele nato uporabimo `colorScheme` za presojo.

## Dodatno znanje: določanje velikosti pisave

Ko smo se prej učili `font`, smo uporabili nekaj sistemskih slogov pisave:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

Poleg uporabe sistemskih slogov pisave, kot sta `.largeTitle` in `.callout`, lahko velikost pisave določimo tudi ročno.

Na primer:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Tukaj:

```swift
.font(.system(size: 100))
```

pomeni, da velikost pisave nastavimo na `100 pt`.

Pri ikonah `SF Symbols` tudi `font` vpliva na velikost ikone.

Če torej želite, da je ikona prikazana večja, lahko velikost določite z `.font(.system(size:))`.

Na primer:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Pomembno je vedeti, da je ročno določanje velikosti pisave sicer bolj prilagodljivo, vendar pri navadnem besedilu ni priporočljivo pogosto uporabljati fiksnih velikosti pisave.

Pri navadnem besedilu naj imajo prednost sistemski slogi pisave, kot so `.title`, `.headline`, `.body` in `.caption`.

Tako se lahko bolje prilagodi različnim napravam in uporabnikovim nastavitvam velikosti pisave.
