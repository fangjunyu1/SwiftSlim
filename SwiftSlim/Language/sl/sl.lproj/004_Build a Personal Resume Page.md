# Izdelava osebnega življenjepisa

V tej lekciji bomo izdelali preprost pogled osebnega življenjepisa in spoznali naslednje pojme:

- cornerRadius
- spacing
- ScrollView

Med izdelavo bomo ponovili postavitve, Text in Image ter hkrati uresničili nadzor razmikov in učinek drsenja vsebine.

## Osebni življenjepis

Ciljni videz:

![Swift](../../RESOURCE/004_img.png)

**Najprej poskusite nalogo rešiti samostojno, nato nadaljujte z razlago spodaj.**

### Ustvarjanje projekta

Ustvarite nov projekt za iOS ali pa nadaljujte z že obstoječim projektom.

Privzeta koda ContentView:

```swift
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
````

Zdaj izbrišite obstoječo vsebino in začnite pisati svojo kodo:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Celotna struktura

V dejanskem razvoju običajno najprej načrtujemo celotno strukturo.

Naša stran vsebuje:

1. naslov
2. osebne podatke
3. osebni opis

Na zunanji ravni dodamo VStack:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

VStack zagotavlja navpično razporeditev pogledov ter omogoča nadzor nad njihovim razporedom in razmiki.

### Naslov

Najprej ustvarimo Text za prikaz naslova.

Tukaj bom naslov prikazal s svojim angleškim imenom:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Naslov je običajno večji in poudarjen, zato tukaj uporabimo modifikatorja font in fontWeight:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Postavitev

Privzeta poravnava v SwiftUI je center, zato je naslov zdaj prikazan na sredini ContentView.

![Swift](../../RESOURCE/004_img3.png)

Naslov moramo prikazati na vrhu pogleda, kar lahko dosežemo z uporabo Spacer za prilagoditev postavitve:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Spacer zasede preostali prostor in potisne Text proti vrhu vsebnika.

![Swift](../../RESOURCE/004_img4.png)

### Prazen prostor

Če se vam zdi, da je besedilo preblizu zgornjega roba, lahko uporabite padding ali Spacer.

**1. padding**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

S tem nastavimo zgornji odmik VStack na 20.

**2. Spacer**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

Lahko uporabite tudi Spacer in z nastavitvijo višine frame dobite prazen prostor določene višine.

Rezultat:

![Swift](../../RESOURCE/004_img5.png)

### Slika

Pripravimo svojo portretno fotografijo in jo dodamo v mapo z viri Assets.

![Swift](../../RESOURCE/004_img6.png)

V ContentView uporabimo Image za prikaz slike:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Ker je izvirna velikost slike precej velika, moramo uporabiti frame za nadzor njene velikosti prikaza.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Tukaj pa opazimo težavo:

če razmerje širine in višine v frame ne ustreza izvirnemu razmerju slike, se slika popači.

Na primer:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Da preprečimo popačenje slike, moramo uporabiti scaledToFit:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

Vloga scaledToFit je naslednja:

znotraj podanega frame sliko pomanjša ali poveča glede na njeno izvirno razmerje stranic in pri tem prikaže celotno vsebino slike.

Slike ne raztegne na silo, da bi zapolnila celoten frame, temveč ohrani razmerje širine in višine ter jo sorazmerno prilagodi, dokler se ena od stranic ravno ne poravna z mejo.

To pomeni:

* če je širina frame manjša, se slika prilagodi glede na širino
* če je višina frame manjša, se slika prilagodi glede na višino
* slika vedno ohrani izvirno razmerje in se ne popači

Običajno lahko nastavite samo eno dimenzijo. Na primer:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Sistem bo nato glede na širino 140 samodejno izračunal ustrezno višino in pri tem ohranil razmerje slike.

Če želite ohraniti določen vizualni delež ali preprečiti stiskanje v zahtevnejših postavitvah, lahko omejite tako širino kot višino.

### Zaobljeni vogali

Če želite, da je slika prikazana z zaobljenimi vogali, lahko uporabite modifikator cornerRadius:

```swift
.cornerRadius(10)
```

Na primer:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Za Image dodamo modifikator cornerRadius(20).

![Swift](../../RESOURCE/004_img9.png)

cornerRadius(20) pomeni, da se robovi pogleda obrežejo in dobijo polmer zaoblitve 20.

Po dodajanju zaobljenih vogalov postanejo štirje koti slike zaobljeni, kar daje mehkejši in sodobnejši videz.

Takšen slog je v sodobnem oblikovanju zelo pogost. Na primer, ikone aplikacij v iOS uporabljajo obliko zaobljenega pravokotnika, čeprav sistemske ikone uporabljajo superelipso z zvezno krivuljo in ne navadnih zaobljenih vogalov.

### Osebni podatki

Zdaj začnemo izdelovati območje z osebnimi podatki na levi strani slike. Iz strukture vmesnika vidimo, da so osebni podatki in slika razporejeni vodoravno, zato moramo uporabiti HStack.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

Vsebina osebnih podatkov je razporejena navpično.

![Swift](../../RESOURCE/004_img11.png)

Zato uporabimo HStack na zunanji ravni, VStack za osebne podatke in Text za besedilno vsebino.

Osnovna struktura:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Poudarjanje imen polj**

Da ločimo ime polja od njegove vrednosti, lahko za imena polj uporabimo fontWeight:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Leva poravnava besedila**

VStack je privzeto sredinsko poravnan. Če želimo vse besedilo poravnati levo, moramo nastaviti alignment:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

.leading pomeni poravnavo na levo stran v jezikovnem okolju od leve proti desni.

![Swift](../../RESOURCE/004_img14.png)

### Razmik

Če želimo med osebnimi podatki in sliko pustiti določen razmik, smo prej za praznino uporabljali Spacer:

```swift
Spacer()
    .frame(width: 10)
```

Lahko pa uporabimo tudi parameter spacing v HStack:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

spacing: 30 pomeni, da bo razmik med obema podrejenima pogledoma 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Kaj je spacing?**

V VStack, HStack in ZStack lahko spacing nadzoruje razdaljo med podrejenimi pogledi.

Na primer:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Razmik med podrejenimi pogledi v VStack bo nastavljen na 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Pomembno je vedeti, da spacing vpliva samo na neposredne podrejene poglede in ne vpliva na postavitev znotraj ugnezdenih vsebnikov.

**Nadzor razmika znotraj seznama**

Če želimo povečati razmik med posameznimi polji, je najbolj neposreden način, da VStack nastavimo spacing:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

S tem bo razmik med vsemi podrejenimi pogledi postal 10 pt.

Če pa pogledamo vmesnik, opazimo težavo:

med skupinami polj je razmik, hkrati pa se enak razmik pojavi tudi med imenom polja in vrednostjo polja.

To je zato, ker spacing deluje na vse neposredne podrejene poglede trenutnega vsebnika.

V tej strukturi je vsak Text neposreden podrejeni pogled zunanjega VStack, zato je razmik enoten.

Če želimo, da je razmik med skupinami polj večji, med imenom polja in njegovo vrednostjo pa ostane privzeto tesen, lahko par "ime polja + vrednost polja" obravnavamo kot logično celoto in ga zavijemo v lasten VStack:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

Takrat bo razmik veljal med zunanjimi VStack, medtem ko bo znotraj notranjih VStack ostal privzeto tesen, zato med imenom polja in vrednostjo ne bo dodatne praznine.

![Swift](../../RESOURCE/004_img18.png)

### Osebni opis

Zdaj izdelamo območje osebnega opisa.

Iz strukture vmesnika je razvidno, da je vsebina opisa sestavljena iz več vrstic besedila, ki so razporejene navpično.

![Swift](../../RESOURCE/004_img19.png)

Zato lahko uporabimo VStack skupaj z Text:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Povečanje razmika**

Zdaj sta del osebnih podatkov in osebnega opisa precej skupaj, zato videz ni posebej lep.

![Swift](../../RESOURCE/004_img20.png)

Ker se oba dela nahajata znotraj istega zunanjega vsebnika, lahko celoten razmik nadzorujemo na zunanjem vsebniku:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Rezultat:

![Swift](../../RESOURCE/004_img21.png)

**Razmik med elementi seznama**

Za nastavitev razmika med vrsticami osebnega opisa uporabimo spacing:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Dokončan osebni življenjepis

Zdaj je osnovna struktura našega osebnega življenjepisa dokončana.

![Swift](../../RESOURCE/004_img.png)

### Pogled za drsenje

Trenutno je struktura strani zgrajena z VStack, kar ni težava, ko je opisnih vrstic malo. Če pa jih povečamo na 20, 30 ali več, bo višina vsebine presegla zaslon.

Na primer:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

Takrat se pojavita dva pojava:

* spodnja vsebina je odrezana
* stran se ne more pomikati

To ni težava VStack, saj je VStack le vsebnik za postavitev in sam po sebi ne omogoča drsenja.

**Kaj je ScrollView**

ScrollView je vsebnik z možnostjo drsenja, primeren za velike količine vsebine, ki presega velikost zaslona. Uporablja se na primer za navpične ali vodoravne sezname.

Osnovna struktura:

```swift
ScrollView {
    ...
}
```

Če želimo doseči učinek drsenja, moramo celotno vsebino strani oviti v ScrollView:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

Tako celotna stran postane drsno območje in ko vsebina preseže višino zaslona, se lahko naravno pomikamo navzdol.

ScrollView privzeto prikaže kazalnik drsenja. Če ga želite skriti, lahko nastavite:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Celotna koda

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}
```