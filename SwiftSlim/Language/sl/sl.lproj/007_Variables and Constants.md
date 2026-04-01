# Spremenljivke in konstante

V tej lekciji bomo predvsem spoznali spremenljivke in konstante v Swiftu ter nekatere pogoste podatkovne tipe in osnovne operatorje.

To je najbolj osnovna vsebina v programiranju in hkrati pomembna podlaga za nadaljnje učenje SwiftUI.

## Spremenljivke in konstante v vsakdanjem življenju

Spremenljivke in konstante lahko razumemo skozi stvari iz vsakdanjega življenja.

Spremenljivke v vsakdanjem življenju:

- vsebina posameznih televizijskih programov je različna
- vreme je vsak dan drugačno
- kazalec ure se spreminja vsako sekundo

Skupna značilnost teh stvari je, da se spreminjajo.

Če bi televizija vedno prikazovala samo eno sliko, bi bilo vreme vedno sončno in bi kazalci ure mirovali, bi bile te stvari konstante.

Ena vrsta stvari se lahko spreminja, druga pa ne.

## Razumevanje spremenljivk in konstant

Pri razvoju aplikacij mora uporabnik pogosto vnesti ali shraniti določene informacije.

Na primer:

- ime računa
- datum rojstva
- kontaktne podatke
- naslov

Te informacije se shranijo in nato prikažejo.

Na primer, če uporabnik v aplikacijo vnese ime:

``` id="fptr2r"
FangJunyu
```

moramo to ime shraniti, da ga lahko prikažemo v aplikaciji.

Postopek shranjevanja si lahko poenostavljeno predstavljamo kot shranjevanje stvari v predal.

Ko shranimo ime, je to podobno, kot da bi ime dali v predal.

Ker je stvari, ki jih želimo shraniti, lahko veliko, je lahko tudi predalov veliko. Da bi vedeli, kaj je v katerem predalu, moramo vsakemu dati ime.

Na primer:

```id="bikd4z"
name
```

V tem primeru je name ime predala, FangJunyu pa shranjena informacija.

![Var](../../RESOURCE/007_var.png)

**V Swiftu moramo za shranjevanje podatkov vedno uporabiti deklaracijo spremenljivke (var) ali konstante (let).**

Ker je ime običajno mogoče spremeniti, moramo uporabiti spremenljivko.

```swift id="1yez0y"
var name = "FangJunyu"
```

Tukaj deklariramo spremenljivko z imenom name. Njen tip je String, njena vrednost pa je "FangJunyu".

### Razlika med spremenljivkami in konstantami

Spremenljivke deklariramo z var:

```swift id="87cj6c"
var
```

Konstante deklariramo z let:

```swift id="h4az4m"
let
```

Na primer:

```swift id="4mdmf4"
var name = "FangJunyu"
let id = 123456
```

Če nekaj deklariramo kot spremenljivko, pomeni, da se vrednost lahko spreminja. Če pa deklariramo kot konstanto, vrednosti ni več mogoče spremeniti.

Zato je glavna razlika med spremenljivkami in konstantami v tem, ali je vrednost dovoljeno spremeniti.

### Spreminjanje konstante

Če koda poskuša spremeniti vrednost konstante:

```swift id="w4mnfa"
let name = "Sam"
name = "Bob"
```

bo Swift sporočil, da dodelitve ni mogoče izvesti, ker gre za konstanto.

```id="dmtrzd"
Cannot assign to property: 'name' is a 'let' constant
```

Ta mehanizem pomaga razvijalcem preprečiti, da bi se nekateri pomembni podatki po nesreči spremenili.

### Prikaz v SwiftUI

Odprite datoteko ContentView.swift in znotraj View deklarirajte spremenljivko:

```swift id="kgz59x"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Tukaj deklariramo spremenljivko z imenom name in jo nato prikažemo na zaslonu prek Text.

Če spremenimo vsebino spremenljivke:

```swift id="lkw0kk"
struct ContentView: View {
    var name = "Sam"
    var body: some View {
        Text(name)
    }
}
```

se bo spremenilo tudi besedilo, ki ga prikazuje Text.

Na ta način lahko s spremenljivkami nadzorujemo vsebino, prikazano v vmesniku, ne da bi morali vsakič neposredno spreminjati besedilo v Text.

Če moramo te informacije uporabiti še kje drugje, lahko spremenljivko posredujemo naprej, kar je podobno, kot da vsebino iz »predala« predamo drugemu delu kode.

### Položaj spremenljivk in konstant v SwiftUI

V SwiftUI so spremenljivke in konstante običajno zapisane zunaj body:

```swift id="j8smav"
struct ContentView: View {
    var name = "FangJunyu"

    var body: some View {
        Text(name)
    }
}
```

Seveda lahko spremenljivke in konstante zapišemo tudi znotraj body:

```swift id="namn2h"
struct ContentView: View {
    var body: some View {
        var name = "FangJunyu"
        Text(name)
    }
}
```

Vendar med obema pristopoma obstaja pomembna razlika:

* če so spremenljivke in konstante zapisane znotraj body, se ob vsakem ponovnem izračunu pogleda ustvarijo znova
* če so zapisane zunaj body, obstajajo kot lastnosti strukture pogleda, zato je struktura kode jasnejša

Zato se v dejanskem razvoju spremenljivke in konstante običajno zapisujejo zunaj body.

## Podatkovni tipi

Spremenljivke lahko shranjujejo veliko različnih vrst podatkov. Tem vrstam pravimo podatkovni tipi.

Na primer, prej smo s Text prikazovali besedilo:

```swift id="qwwxsx"
Text("Hello, World")
```

Tukaj je "Hello, World" tipa String.

String se uporablja za predstavitev besedila in mora biti v Swiftu zapisan v dvojnih narekovajih "".

Na primer:

```swift id="feixpi"
var hello = "Hello, World"
```

Poleg nizov obstaja v Swiftu še veliko drugih podatkovnih tipov.

V začetni fazi so najpogostejši štirje tipi:

* String
* Int
* Double
* Bool

Ti štirje tipi zadoščajo za večino osnovne obdelave podatkov.

**String**

String predstavlja besedilno vsebino, na primer:

```swift id="fpy0u3"
var name = "FangJunyu"
var city = "Rizhao"
```

Nizi se običajno uporabljajo za: uporabniška imena, naslove in besedilne vsebine.

**Int**

Int predstavlja celo število, torej število brez decimalnega dela.

Na primer:

```swift id="4m75p6"
var age = 26
var count = 100
```

Cela števila se običajno uporabljajo za: starost, količino in štetje.

**Double**

Double predstavlja število z decimalnim delom.

Na primer:

```swift id="m7sh2z"
var weight = 74.5
var height = 185.0
```

V Swiftu se decimalna števila običajno privzeto obravnavajo kot tip Double.

Obstaja tudi podoben tip Float, vendar ima manjši razpon vrednosti, zato se v dejanskem razvoju Double uporablja pogosteje.

**Bool**

Tip Bool predstavlja dve stanji: true in false.

Na primer:

```swift id="4tjjyx"
var isShowAlert = true
var isLogin = false
```

Tip Bool se pogosto uporablja pri pogojnih preverjanjih. Na primer, ali naj se prikaže opozorilno okno.

Kadar obstajata samo dve možnosti, je Bool zelo primeren za predstavitev takšnih stanj.

### Prikaz v SwiftUI

Ko prikazujemo tip String, ga lahko neposredno uporabimo v Text:

```swift id="kl6epn"
Text(name)
```

Tipi, kot sta Int in Double, pa niso nizi, zato jih ne moremo neposredno uporabiti kot del besedilne vsebine.

Če želimo te podatke prikazati v Text, lahko uporabimo interpolacijo nizov (String Interpolation):

```swift id="v2kfhn"
\()
```

Interpolacija nizov mora biti zapisana znotraj besedila niza in spremenljivka ali konstanta mora biti obdana z \().

Na primer:

```swift id="wck7ow"
var num = 1

Text("\(num)")
Text("DoubleNum: \(num * 2)")
```

V zgornji kodi "" predstavlja niz, \() pa se uporablja za vstavljanje spremenljivke ali konstante v niz.

Na primer:

```swift id="r0t4uu"
"DoubleNum: \(num * 2)"
```

prikaže naslednjo vsebino:

```id="9esetx"
DoubleNum: 2
```

Na ta način lahko v niz vstavimo spremenljivke ali konstante in jih nato s Text prikažemo v vmesniku.

Namig: \() lahko uporabljamo samo znotraj niza "".

## Operatorji

Ko deklariramo spremenljivko ali konstanto, pogosto vidimo zapis, kot je ta:

```swift id="itw11c"
var num = 1
```

Tukaj je = operator prirejanja.

Njegova naloga je, da vrednost na desni strani dodeli spremenljivki na levi strani.

V tem primeru je vrednost 1 dodeljena spremenljivki num.

Poleg operatorja prirejanja obstaja še nekaj pogostih operatorjev za računanje:

* `+`
* `-`
* `*`
* `/`

Ko izvajamo izračune s števili, na primer z vrstami Int ali Double, uporabljamo te operatorje.

Na primer:

```swift id="i76ebx"
var age = 21 + 3 // 24
var value = 30 - 2 // 28
var num = 1 * 3 // 3
var weight = 88.5 / 2 // 44.25
```

Po izračunu bo rezultat shranjen v spremenljivko.

## Povzetek

Spremenljivke, konstante in operatorji so najbolj osnovni pojmi v programiranju.

S spremenljivkami in konstantami lahko v programu shranjujemo različne podatke. S podatkovnimi tipi lahko jasno določimo, za kakšno vrsto podatkov gre. Z operatorji pa lahko podatke računamo in obdelujemo.

To znanje je kot osnovni nabor orodij v svetu programiranja. Če jih obvladate, boste postavili trdne temelje za nadaljnje učenje Swifta in SwiftUI.
