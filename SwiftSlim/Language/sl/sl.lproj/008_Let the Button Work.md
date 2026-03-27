# Naj gumb začne delovati

V tej lekciji bomo predvsem spoznali gumb Button, izpis razhroščevalnih informacij s print ter funkcije v Swiftu.

To so temeljne vsebine za interaktivno programiranje v SwiftUI.

## Gumb

Gumb je eden najpogostejših UI-kontrolnikov. Ko želimo prenesti, odpreti ali zapreti nekaj, običajno kliknemo gumb.

Na primer, v App Store kliknemo gumb »Get«, da prenesemo aplikacijo.

![Button](../../RESOURCE/008_button.png)

V SwiftUI je gumb predstavljen z Button.

Osnovna uporaba:

```swift
Button("") {
    
}
````

Strukturo lahko razdelimo na dva dela:

```swift
Button("Besedilo gumba") {
    Koda, ki se izvede ob kliku gumba
}
```

Na primer:

```swift
struct ContentView: View {
    var body: some View {
        Button("Start") {

        }
    }
}
```

Po zagonu bo prikazan gumb Start.

![Button](../../RESOURCE/008_button1.png)

Ko uporabnik klikne gumb, se izvede koda znotraj {}.

Pomembno je poudariti: Button je kontrolnik uporabniškega vmesnika (View) v SwiftUI, zato mora biti zapisan znotraj body.

### Modifikator buttonStyle

V SwiftUI Button ponuja vgrajene sistemske sloge gumbov, ki jih lahko uporabimo z modifikatorjem buttonStyle.

Na primer:

```swift
Button("Start") {
    
}
.buttonStyle(.bordered)
```

buttonStyle bo uporabil slog gumba, ki ga ponuja sistem.

Pogoste možnosti vključujejo:

* .automatic
* .plain
* .bordered
* .borderedProminent
* .borderless

![Button](../../RESOURCE/008_button7.png)

Razlike med temi slogi se večinoma kažejo v tem, ali ima gumb obrobo, ozadje in kako močno je vizualno poudarjen.

## Izpis s print

Pri programiranju pogosto želimo preveriti, ali je program prišel do določenega dela kode.

Swift ponuja funkcijo print za izpis razhroščevalnih informacij.

Osnovni zapis:

```swift
print("Hello")
```

Ta vrstica bo besedilo izpisala v Console（konzolo）.

### Preverjanje delovanja gumba

print lahko zapišemo v gumb, da preverimo, ali je bil kliknjen.

```swift
Button("Start") {
    print("Test 123")
}
```

Ko kliknemo gumb, bo Console izpisal:

```id="emvraa"
Test 123
```

To pomeni, da se je gumb uspešno sprožil.

![Button](../../RESOURCE/008_button3.png)

Opomba: print je koda Swift, ne kontrolnik uporabniškega vmesnika. Ne more biti neposredno postavljen v body, sicer bo prišlo do napake.

Na primer, spodnji zapis je napačen:

```swift
struct ContentView: View {
    var body: some View {
        print("Test 123")  // Napaka: body mora vrniti View
    }
}
```

V SwiftUI se body uporablja za opis strukture vmesnika, zato lahko vsebuje le kontrolnike vmesnika (View), kot so Text, Button, Image in podobno.

Običajna koda, kot so logika izračunov, print in podobno, mora biti zapisana v gumbih, funkcijah ali drugih obdelovalcih dogodkov.

### Konzola Console

Vsebina, ki jo izpiše print, bo prikazana v Console（konzoli）v Xcode.

Če Console ni viden, lahko kliknete gumb Show the Debug Area v spodnjem desnem kotu, da odprete območje za razhroščevanje, nato pa kliknete Show the Console, da prikažete konzolo.

![](../../RESOURCE/008_button4.png)

V spodnjem levem kotu Console sta dve oznaki: Executable in Previews.

![](../../RESOURCE/008_button5.png)

Ti dve oznaki ustrezata različnim okoljem izvajanja: ko uporabljate predogled v Canvas, bo izpis print prikazan pod zavihkom Previews; če aplikacijo zaženete v simulatorju ali na fizični napravi, bo izpis prikazan pod zavihkom Executable.

Če torej opazite, da print ne izpisuje ničesar, najprej preverite, ali ste izbrali pravi zavihek.

## Primer - ASCII znakovna slika

V nekaterih programskih projektih pogosto vidimo ASCII znakovne slike.

To so slike, sestavljene iz navadnih znakov, na primer:

![ASCII](../../RESOURCE/008_ascii.png)

Z gumbom + print lahko izpišemo ASCII znakovno sliko.

Primer kode:

```swift
struct ContentView: View {
    var body: some View {
        Button("Show ASCII") {
            print(" /\\_/\\")
            print("( o.o )")
            print(" > ^ <")
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Ko kliknemo gumb, bo Console izpisal:

```id="v2z8k1"
 /\_/\
( o.o )
 > ^ <
```

Opomba: znak \ v nizu mora biti zapisan kot \, ker je poševnica nazaj v nizu ubežni znak.

## Funkcije

V gumbu lahko kodo napišemo neposredno.

Na primer:

```swift
Button("Start") {
    print("Hello")
}
```

Če je kode malo, je ta zapis povsem v redu. V resničnem razvoju pa je lahko logika, ki jo sproži en gumb, precej obsežna.

Na primer:

```swift
Button("Start") {
    print("Hello")
    print("World")
    print("This")
    print("is")
    // Morda je tu še veliko več kode
}
```

Če je kode vedno več, bo neposredno pisanje v gumb povzročilo, da bo koda vmesnika postala nepregledna in težavna za branje ter vzdrževanje.

Zato takšno kodo običajno premaknemo v funkcijo, nato pa to funkcijo pokličemo iz gumba.

### Kaj je funkcija

Funkcija je del kode, ki ga lahko večkrat uporabimo.

Ko želimo izvesti določeno kodo, samo pokličemo to funkcijo in izvede se koda znotraj nje.

Tako je struktura kode preglednejša, hkrati pa je omogočena ponovna uporaba.

### Osnovni zapis

V Swiftu funkcijo definiramo s ključno besedo **func**:

```swift
func randomInt() {
    // code
}
```

Ta koda definira funkcijo.

randomInt je ime funkcije, ki se uporablja za označevanje tega dela kode.

() predstavlja mesto za parametre; tu lahko funkcija prejme podatke od zunaj. Če podatkov ne potrebujemo, ostane prazno.

{} je območje kode funkcije. Vsa koda, ki jo želimo izvesti, je napisana tukaj.

Na primer:

```swift
func getName() {
    print("FangJunyu")
}
```

Naloga te funkcije je izpis besedila.

### Klic funkcije

Definicija funkcije samo ustvari ta del kode. Če jo želimo izvesti, jo moramo še poklicati.

Način klica je, da za ime funkcije dodamo ():

```swift
getName()
```

Ko program izvede to vrstico, bo izvedel kodo v funkciji getName.

Celoten primer:

```swift
func getName() {
    print("FangJunyu")
}

getName()
```

Po zagonu bo Console izpisal:

```id="v1dd4p"
FangJunyu
```

### Uporaba funkcij v SwiftUI

V SwiftUI pogledu so funkcije običajno zapisane zunaj body.

Na primer:

```swift
struct ContentView: View {

    func getName() {
        print("FangJunyu")
    }

    var body: some View {
        Button("getName") {
            getName()
        }
    }
}
```

Ko kliknemo gumb, se bo poklicala funkcija getName().

Na ta način ostane koda vmesnika preprosta, konkretna logika pa se obdeluje v funkciji.

### Parametri funkcije

Včasih mora funkcija izvesti različna dejanja glede na različne podatke.

Na primer, želimo, da funkcija izpisuje različna imena in ne le fiksnega "FangJunyu".

Takrat lahko uporabimo parametre. Parameter lahko razumemo kot podatke, ki jih predamo ob klicu funkcije.

Na primer:

```swift
func getName(name: String) {
    print(name)
}
```

Ta funkcija ima nov parameter. name je ime parametra, String pa je tip parametra.

To pomeni, da mora funkcija prejeti podatek tipa String.

Ker funkcija zdaj potrebuje podatek, ga moramo ob klicu tudi zagotoviti.

```swift
getName(name: "Sam")
```

Ko ob klicu podamo "Sam", bo funkcija znotraj sebe uporabila to vrednost za izpis.

Rezultat izvajanja:

```id="q6rgu5"
Sam
```

## Primer - izpis ASCII znakovne slike s funkcijo

V prejšnjem primeru smo print zapisali neposredno v gumb.

Če pa je znakovna slika bolj zapletena, bo koda postala dolga. Takrat lahko logiko prestavimo v funkcijo, da bo koda vmesnika jasnejša.

Primer kode:

```swift
struct ContentView: View {

    func printCat() {
        print(" /\\_/\\")
        print("( o.o )")
        print(" > ^ <")
    }

    var body: some View {
        Button("Show ASCII") {
            printCat()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

Po zagonu in kliku gumba bo Console izpisal:

```id="kjlwmj"
 /\_/\
( o.o )
 > ^ <
```

Tukaj se zgodita dve stvari, ko uporabnik klikne gumb:

1. gumb pokliče funkcijo printCat()
2. izvede se koda print znotraj funkcije

Tako koda vmesnika ostane odgovorna samo za sprožitev dogodka, konkretna logika pa je obdelana v funkciji.

V dejanskem razvoju je večina dejanj gumbov izvedena prek funkcij.

## Povzetek

V tej lekciji smo spoznali tri pomembne vsebine:

**1. Gumb Button**

Button je kontrolnik v SwiftUI, ki se uporablja za sprožanje dejanj.

```swift
Button("Start") {

}
```

Ko uporabnik klikne gumb, se izvede koda znotraj zavitih oklepajev.

**2. Izpis s print**

print se uporablja za izpis razhroščevalnih informacij v Console.

```swift
print("Hello")
```

Razvijalec lahko prek Console spremlja stanje izvajanja programa.

**3. Funkcije**

Funkcija je del kode, ki ga lahko večkrat uporabimo.

```swift
func sayHello() {
    print("Hello")
}
```

Klic funkcije:

```swift
sayHello()
```

Če funkcija potrebuje podatke, lahko uporabimo parametre:

```swift
func sayHello(name: String) {
    print(name)
}
```

V naslednjih lekcijah bomo nadaljevali z učenjem več kontrolnikov SwiftUI in spoznali, kako podatki komunicirajo z vmesnikom.

## Vaja

Poskusite dokončati naslednje naloge:

1. ustvarite gumb z besedilom "Hello"
2. ob kliku gumba izpišite v Console: Hello Swift
3. kodo za izpis zapišite v funkcijo, nato pa to funkcijo pokličite iz gumba
