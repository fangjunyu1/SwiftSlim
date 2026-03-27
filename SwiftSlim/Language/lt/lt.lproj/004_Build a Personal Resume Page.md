# Asmeninio gyvenimo aprašymo puslapio kūrimas

Šioje pamokoje sukursime paprastą asmeninio gyvenimo aprašymo vaizdą ir išmoksime šiuos dalykus:

- cornerRadius
- spacing
- ScrollView

Kūrimo metu pakartosime išdėstymo, `Text` ir `Image` žinias, taip pat įgyvendinsime tarpų valdymą ir slenkamo turinio efektą.

## Asmeninis gyvenimo aprašymas

Tikslinis rezultatas:

![Swift](../../RESOURCE/004_img.png)

**Pirmiausia pabandykite tai sukurti savarankiškai, o tik tada skaitykite tolesnį paaiškinimą.**

### Projekto sukūrimas

Sukurkite naują iOS projektą arba tęskite darbą su ankstesniu projektu.

Numatytasis ContentView kodas:

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
```

Dabar išvalykite kodą ir pradėkite rašyti savo turinį:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Bendra struktūra

Praktiniame kūrime dažniausiai pirmiausia suprojektuojame bendrą struktūrą.

Mūsų puslapį sudarys:

1. pavadinimas
2. asmeninė informacija
3. asmeninis prisistatymas

Išorėje pridedame `VStack`:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` užtikrina vertikalų vaizdų išdėstymą ir leidžia valdyti vaizdų rikiavimą bei tarpus.

### Pavadinimas

Pirmiausia sukuriame `Text`, kuris rodys pavadinimą.

Čia aš pavadinimui naudosiu savo vardą anglų kalba:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

Pavadinimas dažniausiai būna didesnis ir paryškintas, todėl čia naudojame `font` ir `fontWeight` modifikatorius:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Išdėstymas

Numatytasis SwiftUI lygiavimas yra `center`, todėl dabar pavadinimas rodomas `ContentView` viduryje.

![Swift](../../RESOURCE/004_img3.png)

Mums reikia rodyti pavadinimą viršutinėje vaizdo dalyje, todėl išdėstymą galime pakoreguoti naudodami `Spacer`:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` užims likusią vietą ir pastums `Text` į konteinerio viršų.

![Swift](../../RESOURCE/004_img4.png)

### Tuščia erdvė

Jei manote, kad tekstas yra per arti viršaus, galite naudoti `padding` arba `Spacer`.

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

Tai nustato `VStack` viršutinę paraštę į 20.

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

Taip pat galima naudoti `Spacer` ir nurodyti jo aukštį per `frame`, kad gautumėte konkretaus aukščio tuščią vietą.

Rezultatas:

![Swift](../../RESOURCE/004_img5.png)

### Paveikslėlis

Pasiruošiame savo portreto nuotrauką ir įdedame ją į `Assets` išteklių aplanką.

![Swift](../../RESOURCE/004_img6.png)

Tada `ContentView` faile naudojame `Image`, kad ją parodytume:

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

Kadangi originalus paveikslėlio dydis yra gana didelis, turime naudoti `frame`, kad suvaldytume jo rodomą dydį.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

Šiuo metu pastebėsime vieną problemą:

Jei `frame` pločio ir aukščio santykis nesutampa su originaliomis paveikslėlio proporcijomis, paveikslėlis deformuojasi.

Pavyzdžiui:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Kad išvengtume paveikslėlio deformacijos, turime naudoti `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

`scaledToFit` veikimas yra toks:

Duoto `frame` ribose paveikslėlis masteliuojamas pagal originalias proporcijas ir visas jo turinys rodomas pilnai.

Jis nepriverčia paveikslėlio išsitempti taip, kad užpildytų visą `frame`, o išlaiko kraštinių santykį nepakitusį ir mastelį keičia proporcingai tol, kol viena kraštinė tiksliai prisiliečia prie ribos.

Tai reiškia:

- jei `frame` plotis yra mažesnis, paveikslėlis masteliuojamas pagal plotį
- jei `frame` aukštis yra mažesnis, paveikslėlis masteliuojamas pagal aukštį
- paveikslėlis visada išlaiko originalias proporcijas ir nesideformuoja

Dažniausiai pakanka nustatyti vienos krypties dydį. Pavyzdžiui:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Tokiu atveju sistema automatiškai apskaičiuos tinkamą aukštį pagal plotį 140 ir kartu išlaikys paveikslėlio proporcijas.

Jei reikia išlaikyti konkretų vizualinį santykį arba išvengti suspaudimo sudėtingame išdėstyme, galima apriboti ir plotį, ir aukštį.

### Užapvalinti kampai

Jei norime, kad paveikslėlis būtų rodomas su užapvalintais kampais, galime naudoti `cornerRadius` modifikatorių:

```swift
.cornerRadius(10)
```

Pavyzdžiui:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Po `Image` modifikatorių grandinės pridedame `cornerRadius(20)`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` reiškia, kad vaizdo ribos yra apkerpamos ir joms pritaikomas 20 spindulio kampų užapvalinimas.

Pridėjus užapvalintus kampus, keturi paveikslėlio kampai tampa lankinėmis formomis, todėl vaizdas atrodo švelnesnis ir modernesnis.

Toks dizaino stilius šiuolaikinėse sąsajose yra labai dažnas. Pavyzdžiui, iOS programų piktogramos taip pat naudoja užapvalintą stačiakampio formą (nors sistemos piktogramos naudoja ne paprastą kampų užapvalinimą, o vientisos kreivės superelipsės formą).

### Asmeninė informacija

Dabar pradedame įgyvendinti asmeninės informacijos sritį kairėje nuo paveikslėlio. Iš sąsajos struktūros matyti, kad asmeninė informacija ir paveikslėlis yra išdėstyti horizontaliai, todėl reikia naudoti `HStack`.

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

Pati asmeninė informacija išdėstoma vertikaliai.

![Swift](../../RESOURCE/004_img11.png)

Todėl išorėje naudosime `HStack`, asmeninei informacijai — `VStack`, o tekstui — `Text`.

Pagrindinė struktūra:

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

**Laukų pavadinimų paryškinimas**

Norėdami atskirti lauko pavadinimą nuo reikšmės, lauko pavadinimui galime naudoti `fontWeight`:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Teksto lygiavimas į kairę**

`VStack` pagal nutylėjimą lygiuojamas centre. Jei norime, kad visas tekstas būtų lygiuojamas į kairę, reikia nustatyti lygiavimo būdą:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` reiškia lygiavimą pagal kairiąją pusę (kalbų aplinkoje, kur tekstas rašomas iš kairės į dešinę).

![Swift](../../RESOURCE/004_img14.png)

### Tarpai

Jei norime palikti fiksuotą tarpą tarp asmeninės informacijos ir paveikslėlio, anksčiau mokėmės naudoti `Spacer` tuščiai erdvei sukurti:

```swift
Spacer()
    .frame(width: 10)
```

Taip pat galime naudoti `HStack` `spacing` parametrą:

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

`spacing: 30` reiškia, kad tarpas tarp dviejų vidinių vaizdų yra 30 pt.

![Swift](../../RESOURCE/004_img15.png)

**Kas yra spacing?**

`VStack`, `HStack` ir `ZStack` viduje `spacing` leidžia valdyti atstumą tarp vaikinių vaizdų.

Pavyzdžiui:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

Vaikinių vaizdų tarpas `VStack` viduje bus nustatytas į 10 pt.

![Swift](../../RESOURCE/004_img16.png)

Svarbu atkreipti dėmesį, kad `spacing` veikia tik „tiesioginius vaikinius vaizdus“ ir neveikia įdėtų konteinerių vidinio išdėstymo.

**Vidinių sąrašo tarpų valdymas**

Jei norime padidinti tarpus tarp laukų, paprasčiausias būdas yra nustatyti `VStack` `spacing`:

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

Tokiu būdu visi tarpai tarp vaikinių vaizdų taps 10 pt.

Tačiau pažvelgę į sąsają pastebėsime vieną problemą:

Tarpai atsiranda ne tik tarp laukų grupių, bet ir tarp lauko pavadinimo bei jo reikšmės.

Taip yra todėl, kad `spacing` veikia visus tiesioginius dabartinio konteinerio vaikinius vaizdus.

Šioje struktūroje kiekvienas `Text` yra tiesioginis išorinio `VStack` vaizdas, todėl tarpai yra vienodi.

Jei norime, kad būtų tarpai tarp laukų grupių, o tarp lauko pavadinimo ir reikšmės išliktų numatytasis glaudus tarpas, galime „lauko pavadinimą + lauko reikšmę“ traktuoti kaip vieną loginę visumą ir apgaubti ją papildomu `VStack`:

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

Tuomet struktūra tampa tokia: tarp išorinio `VStack` elementų atsiranda tarpai, o vidinių `VStack` elementų tarpas lieka numatytasis glaudus, todėl tarp pavadinimo ir reikšmės papildomų tarpų neatsiras.

![Swift](../../RESOURCE/004_img18.png)

### Asmeninis prisistatymas

Toliau įgyvendinsime asmeninio prisistatymo sritį.

Iš sąsajos struktūros matyti, kad prisistatymo turinys susideda iš kelių teksto eilučių, kurios išdėstytos vertikaliai.

![Swift](../../RESOURCE/004_img19.png)

Todėl galima naudoti `VStack` kartu su `Text`:

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

**Tarpų didinimas**

Dabar asmeninės informacijos ir prisistatymo dalys atrodo gana suspaustos ir nėra labai estetiškos.

![Swift](../../RESOURCE/004_img20.png)

Kadangi abi jos yra tame pačiame išoriniame konteineryje, bendrą tarpą galima valdyti išoriniame konteineryje:

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

Rezultatas:

![Swift](../../RESOURCE/004_img21.png)

**Sąrašo tarpai**

Naudojant `spacing` galima nustatyti tarpus tarp prisistatymo teksto eilučių:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Gyvenimo aprašymo užbaigimas

Dabar mūsų asmeninio gyvenimo aprašymo pagrindinė struktūra jau baigta.

![Swift](../../RESOURCE/004_img.png)

### Slenkamas vaizdas

Šiuo metu puslapio struktūra naudoja `VStack`, ir kai prisistatymo tekstų yra nedaug, viskas veikia gerai. Tačiau jei jų padidės iki 20, 30 ar dar daugiau, turinio aukštis viršys ekrano aukštį.

Pavyzdžiui:

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

Tuomet pastebėsime du reiškinius:

- apatinė turinio dalis bus nukirsta
- puslapio nebus galima slinkti

Tai nėra `VStack` problema. `VStack` yra tik išdėstymo konteineris ir pats savaime nesuteikia slinkimo galimybės.

**Kas yra ScrollView**

`ScrollView` yra slenkantis konteineris, tinkamas dideliam kiekiui turinio, kuris viršija ekrano dydį. Pavyzdžiui, vertikaliems ar horizontaliems sąrašams.

Pagrindinė struktūra:

```swift
ScrollView {
    ...
}
```

Jei norime įgyvendinti slinkimo efektą, visą puslapio turinį turime apgaubti `ScrollView`:

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

Tokiu būdu visas puslapis tampa viena slenkama sritimi, todėl kai turinys viršija ekrano aukštį, jį galima natūraliai slinkti.

Pagal nutylėjimą `ScrollView` rodo slinkties indikatorių. Jei norite jį paslėpti, galite nustatyti:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Pilnas kodas

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
