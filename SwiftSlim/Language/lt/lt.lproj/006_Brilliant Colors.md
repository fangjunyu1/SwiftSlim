# Ryškios spalvos

Šioje pamokoje mokysimės dažnai naudojamų SwiftUI vaizdinių modifikatorių, įskaitant:

- spalvas
- priekinio plano spalvą
- fono spalvą
- poslinkį
- skaidrumą
- suliejimą

Taip pat išmoksime apie Safe Area (saugią sritį).

Šie modifikatoriai naudojami vaizdo išvaizdai valdyti, kad sąsaja būtų aiškesnė ir labiau sluoksniuota.

## Spalvos

SwiftUI aplinkoje galima nustatyti teksto spalvą.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` reiškia mėlyną spalvą ir iš tikrųjų yra sutrumpintas `Color.blue` užrašymas (dėl tipo išvedimo).

Dažnos spalvos:

```
.black
.green
.yellow
.pink
.gray
...
```

Visos jos yra `Color` statinės savybės.

![Color](../../RESOURCE/006_color.png)

Galima suprasti `Color` kaip spalvos tipą, o `.blue`, `.red` — kaip konkrečias jo spalvų reikšmes.

### Color vaizdas

SwiftUI aplinkoje `Color` gali būti rodomas ir kaip atskiras vaizdas.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

Šis kodas sukurs 100×100 raudoną kvadratą.

Taip pat galima nudažyti visa ekraną tam tikra spalva:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Paleidus galima pamatyti, kad raudona spalva neuždengia viso ekrano — viršuje ir apačioje vis dar lieka balta sritis. Tai susiję su Safe Area (saugios srities) egzistavimu.

## Safe Area (saugi sritis)

Safe Area yra sistemos rezervuota sritis, skirta tam, kad turinys nebūtų uždengtas. Ji apima:

1. viršutinę būsenos juostos dalį (laikas, baterija)

2. apatinę Home indikatoriaus juostą

3. ekrano išpjovos (notch) arba Dynamic Island sritį

![Color](../../RESOURCE/006_color3.png)

Pagal nutylėjimą SwiftUI riboja turinį saugioje srityje, todėl vaizdas neišsitempia iki ekrano kraštų.

### Safe Area ignoravimas

Jei norime, kad spalva užpildytų visą ekraną, galime naudoti `ignoresSafeArea`:

```swift
Color.red
    .ignoresSafeArea()
```

Arba `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

Tokiu atveju vaizdas išsitemps per visą ekraną.

Svarbu pažymėti, kad `edgesIgnoringSafeArea` yra senesnis užrašymo būdas, o nuo iOS 14 rekomenduojama naudoti `ignoresSafeArea`.

## Priekinio plano spalva

### foregroundStyle modifikatorius

Ankstesnėse pamokose jau mokėmės, kaip naudoti `foregroundStyle` spalvai nustatyti.

Pavyzdžiui:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` yra naujesnė stiliaus sistema, palaikanti spalvas, gradientus, medžiagas (materials) ir kt.

![Color](../../RESOURCE/006_color2.png)

### foregroundColor modifikatorius

`foregroundColor` taip pat gali būti naudojamas spalvai nustatyti:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

Jo naudojimas toks pat kaip ir `foregroundStyle`.

Naujausiose Xcode versijose Xcode gali įspėti, kad `foregroundColor` ateities iOS versijose gali būti palaipsniui atsisakomas, todėl pirmiausia rekomenduojama naudoti `foregroundStyle`.

## Fonai

Jei norime vaizdui pridėti fono spalvą, galime naudoti `background`:

```swift
background(.red)
```

Pavyzdžiui, jei norime tekstui pridėti foną:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Panašų fono spalvos efektą galime pamatyti pasirinkdami tekstą tokiose programose kaip Word ar Chrome.

![Color](../../RESOURCE/006_color16.png)

Jei norime išplėsti foną, reikia derinti jį su `padding`:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

Čia reikia prisiminti vieną svarbią taisyklę:

SwiftUI modifikatoriai kuria vaizdą iš viršaus į apačią. Vėliau parašyti modifikatoriai veikia prieš tai gautą rezultatą.

Todėl:

```swift
.padding()
.background()
```

reiškia, kad fonas apgaubs vaizdą jau po vidinių paraščių pridėjimo.

Jei eiliškumą sukeisime:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

fonas neišsiplės, nes jis neapgaubia vėliau pridėto `padding`.

## Pavyzdys - keturkampė veržlė

Dabar sukursime paprastą keturkampės veržlės vaizdą.

![Color](../../RESOURCE/006_color8.png)

Pirmiausia sukuriame 50 × 50 baltą kvadratą:

```swift
Color.white
    .frame(width: 50, height: 50)
```

Jei norime, kad jis taptų apskritimu, galime naudoti `cornerRadius`:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Kai kampo spindulys lygus pusei pločio ir aukščio, figūra tampa apskrita.

Dabar pridėkime mėlyną foną:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

Papildytas `padding` išplečia išorinę sritį, o `background` toje išorinėje srityje nupiešia mėlyną foną.

Taip gauname keturkampės veržlės efektą.

### Kitas būdas

Be fono spalvos naudojimo šiam efektui sukurti, keturkampę veržlę galima įgyvendinti ir naudojant `ZStack`.

Anksčiau mokėmės, kad `ZStack` leidžia sluoksniuoti vaizdus vieną ant kito. Keturkampę veržlę taip pat galima suprasti kaip apskritimo ir stačiakampio sutapimą.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` sluoksniuoja vaizdus eilės tvarka, o vėliau pridėti vaizdai rodomi viršuje.

## Pavyzdys - du persidengiantys apskritimai

Daugelis piktogramų kuriamos iš paprastų figūrų persidengimo, pavyzdžiui, dviejų dalinai sutampančių apskritimų.

![Color](../../RESOURCE/006_color14.png)

Pirmiausia sukuriame du apskritimus:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

Kadangi mums reikia, jog abu apskritimai būtų sluoksniuojami, naudojame `ZStack`:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

Šiuo metu abu vienodo dydžio apskritimai visiškai persidengia.

Mums reikia, kad jie persidengtų tik iš dalies, o ne visiškai vienas kitą uždengtų, todėl galime naudoti `offset`, kad sukurtume poslinkio efektą.

## Poslinkis

`offset` keičia tik vaizdo nupiešimo vietą ir neveikia tėvinio vaizdo išdėstymo skaičiavimo.

Naudojimas:

```swift
.offset(x:y:)
```

`x` yra horizontalus poslinkis, `y` — vertikalus poslinkis.

Teigiamos reikšmės reiškia poslinkį į dešinę / žemyn, o neigiamos — į kairę / aukštyn.

Naudojant `offset`, kad abu apskritimai dalinai persidengtų:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Raudono apskritimo vieta išdėstyme nepasikeitė, tačiau jo piešimo vieta pasislinko 25 taškais į kairę. Todėl abu apskritimai sudaro dalinio persidengimo vaizdinį efektą.

## Skaidrumas

SwiftUI aplinkoje `opacity` naudojamas vaizdo skaidrumui nustatyti.

Pagrindinis naudojimas:

```swift
.opacity(0.5)
```

`opacity` reikšmių ribos yra nuo 0.0 iki 1.0, kur:

- 0 reiškia visišką skaidrumą
- 1 reiškia nepermatomumą

Galime naudoti `opacity`, kad nustatytume oranžinio apskritimo skaidrumą:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Kai oranžinio apskritimo `opacity` nustatomas į 0.8, jo nepermatomumas tampa 80%, o persidengiančioje zonoje susidaro spalvų maišymo efektas.

## Suliejimas

SwiftUI aplinkoje suliejimo efektą galima nustatyti naudojant `blur`:

```swift
.blur(radius:10)
```

`radius` apibrėžia suliejimo spindulį: kuo didesnė reikšmė, tuo stipresnis suliejimas.

Galime pridėti suliejimo efektą abiem apskritimams:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

Galutiniame rezultate pamatysime du labai sulietus apskritimus.

## Santrauka

Šioje pamokoje mokėmės dažnų SwiftUI vaizdinių modifikatorių ir supratome, kaip per modifikatorius valdyti vaizdo spalvą, padėtį ir vizualinį efektą.

Per konkrečius pavyzdžius matėme, kokį vaidmenį skirtingi vizualiniai modifikatoriai atlieka sąsajoje, ir susipažinome su saugios srities sąvoka.

Tai yra labai baziniai modifikatoriai, todėl verta juos daugiau praktikuoti ir naudoti. Tai padeda realiame kūrime aiškiau valdyti sąsajos efektus.

### Užduotys po pamokos

- pridėkite paveikslėliui skaidrumo ir suliejimo efektą
- sukurkite tris skirtingo skaidrumo persidengiančius apskritimus
- sukurkite foninį paveikslėlį, užpildantį visą ekraną ir ignoruojantį saugią sritį
- naudokite `offset`, kad pakoreguotumėte kelių vaizdų pozicijas

Šių užduočių tikslas nėra API įsiminimas, o vizualaus pokyčio ir išdėstymo elgesio ryšio stebėjimas。
