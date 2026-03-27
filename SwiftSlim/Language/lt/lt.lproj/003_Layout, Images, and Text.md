# Išdėstymas, paveikslėliai ir tekstas

Praeitoje pamokoje mokėmės `ContentView` kodo:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

Šioje pamokoje mokysimės numatytojo SwiftUI išdėstymo mechanizmo, taip pat paveikslėlių ir teksto naudojimo būdų. Remdamiesi tuo, ką jau išmokome, dar geriau suprasime vaizdų struktūrą ir rodymą, o šios žinios padės kurti pagrindinius sąsajos išdėstymus.

## Numatytoji SwiftUI išdėstymo logika

Peržiūrėdami `ContentView`, pastebėsime, kad piktograma ir tekstas rodomi centre, o ne pradedami nuo viršaus.

![Swift](../../RESOURCE/003_view.png)

Pagal numatytuosius nustatymus Stack konteinerio lygiavimo būdas yra `.center`, todėl vidiniai vaizdai dažniausiai atrodo centruoti.

### Alignment lygiavimo būdas

Akivaizdu, kad centravimas yra tik vienas iš lygiavimo būdų. Jei norime lygiuoti į kairę arba į dešinę, reikia naudoti `alignment`, kuris valdo vaizdo išdėstymo lygiavimą.

```swift
alignment
```

SwiftUI aplinkoje lygiavimas dažniausiai pasirodo dviem atvejais:

**1. Stack konteinerio lygiavimo parametras**

Pavyzdžiui, kad `ContentView` esanti piktograma ir tekstas būtų lygiuojami į kairę:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack` lygiavimo parametras valdo horizontalų lygiavimą.

Lygiavimo variantai:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` yra horizontalus išdėstymas, todėl jo `alignment` valdo vertikalų lygiavimą:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` yra sluoksniuojantis išdėstymas, todėl `alignment` gali valdyti tiek horizontalų, tiek vertikalų lygiavimą:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

Jei `alignment` nenurodysime, `VStack`, `HStack` ir `ZStack` pagal nutylėjimą naudos `.center`.

**2. frame vidinis lygiavimas**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Kai `frame` suteikia daugiau vietos nei pats vaizdas užima natūraliai, `alignment` nusprendžia, kaip vaizdas bus pozicionuojamas pačiame `frame` viduje. Apie `frame` dar kalbėsime vėliau, o kol kas užtenka tiesiog trumpai suprasti šią paskirtį.

### Spacer ir erdvės paskirstymo mechanizmas

`alignment` leidžia vaizdus lygiuoti horizontalia arba vertikalia kryptimi. Tačiau jei norime, kad tekstas ir paveikslėliai būtų išdėstyti abiejuose kraštuose, vien tik lygiavimo tam nepakanka.

Pavyzdžiui, įsivaizduokime [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) svetainės viršutinę dalį, kur kairėje pusėje yra NHK svetainės piktograma, o dešinėje pusėje — meniu piktograma.

![Swift](../../RESOURCE/003_alignment3.png)

Jei naudotume tik `alignment`, abi piktogramos būtų rodomos tik vienoje pusėje. Kadangi negalime jų išskirstyti į kairę ir dešinę puses, reikia naudoti `Spacer`, kuris paskirsto likusią erdvę.

`Spacer` yra elastingas išdėstymo vaizdas, automatiškai užpildantis likusią vietą.

Naudojimas:

```swift
Spacer()
```

Pavyzdžiui:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Kai tarp `Image` ir `Text` pridedame `Spacer`, jis užpildo likusią vietą ir pastumia `Image` bei `Text` į viršų ir apačią.

![Swift](../../RESOURCE/003_view1.png)

Jei yra keli `Spacer`:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

Likusi erdvė bus tolygiai paskirstyta tarp visų `Spacer`.

![Swift](../../RESOURCE/003_spacer.png)

## Image rodymas ir dydžio valdymas

`Image` vaizdas daugiausia naudojamas rodyti paveikslėliams. Praeitoje pamokoje išmoktos SF Symbols piktogramos yra tik vienas `Image` naudojimo būdų.

Naudojimas:

```swift
Image("imageName")
```

Dvigubose kabutėse rašomas paveikslėlio pavadinimas, failo plėtinio rašyti nereikia.

### Paveikslėlio rodymas

Pirmiausia pasiruoškime vieną paveikslėlį.

![Swift](../../RESOURCE/003_img.jpg)

Xcode aplinkoje pasirinkite `Assets` išteklių aplanką ir nutempkite paveikslėlį į `Assets`.

![Swift](../../RESOURCE/003_img1.png)

Tada `ContentView` faile naudokite `Image` vaizdui parodyti:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Pastaba: SwiftUI `Image` nepalaiko GIF animacijos atkūrimo (rodoma tik statiška kadro būsena).

### Paveikslėlio dydžio valdymas

SwiftUI aplinkoje `Image` pagal nutylėjimą rodomas originaliu paveikslėlio dydžiu. Jei norime keisti jo rodymo dydį, pirmiausia turime panaudoti `resizable`, kad vaizdo turinys galėtų būti mastelio keičiamas, o tada naudoti `frame`, kad nurodytume išdėstymo dydį.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### resizable modifikatorius

`resizable` modifikatorius leidžia paveikslėliui dalyvauti dydžio keitime išdėstyme, užuot visada naudojus jo originalų dydį.

```swift
.resizable()
```

Tik pridėjus `resizable()`, `frame` iš tikrųjų gali pakeisti paveikslėlio rodymo dydį.

Jei `resizable` praleisime:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` tik suteiks vietą išdėstymui, tačiau pats paveikslėlis dydžio nepakeis.

### frame modifikatorius

`frame(width:height)` naudojamas nustatyti vaizdo plotį ir aukštį.

Pagrindinis naudojimas:

```swift
.frame(width: 10,height: 10)
```

Pavyzdžiui, jei norime paveikslėlį nustatyti kaip stačiakampį, kurio plotis 300, o aukštis 100:


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Taip pat galima nustatyti tik plotį arba tik aukštį:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` kombinacija leidžia lanksčiai valdyti paveikslėlio rodymo dydį sąsajoje ir kartu išlaikyti mastelio keitimo galimybę.

### Mastelio santykis: scaledToFit ir scaledToFill

Kai `frame` nustatome tokį plotį ir aukštį, kurių santykis nesutampa su originaliu paveikslėlio santykiu, vaizdas gali būti ištemptas ir deformuotas.

Jei norime išlaikyti paveikslėlio proporcijas ir tuo pačiu pritaikyti jį prie turimos vietos, galime naudoti `scaledToFit` arba `scaledToFill`.

**scaledToFit**

`scaledToFit` išlaiko originalų paveikslėlio pločio ir aukščio santykį, sumažina arba padidina jį taip, kad visas tilptų į turimą vietą, ir nepjauna vaizdo:

```swift
.scaledToFit()
```

Arba:

```swift
.aspectRatio(contentMode: .fit)
```

Šis būdas tinka, kai svarbu pilnai parodyti paveikslėlį ir nenorima jo deformuoti.

Jei kiekvienam paveikslėliui nustatysime vienodą plotį ir aukštį, neišvengiamai atsiras ištempimo situacijų.

Pavyzdžiui:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Nenustačius mastelio būdo, paveikslėlis nebus rodomas pagal originalias proporcijas.

![Swift](../../RESOURCE/003_img4.png)

Nustačius `scaledToFit`, paveikslėlis išlaikys originalias proporcijas.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill` taip pat išlaiko paveikslėlio proporcijas, tačiau užpildo visą prieinamą plotą. Jei proporcijos nesutampa, perteklinė dalis bus apkarpyta:

```swift
.scaledToFill()
```

Arba:

```swift
.aspectRatio(contentMode: .fill)
```

Šis būdas tinka scenarijams, kai norime, kad paveikslėlis visiškai uždengtų tam tikrą sritį, pavyzdžiui, foniniam vaizdui ar reklamjuostei. Jis ypač tinkamas, kai paveikslėlis naudojamas kaip fonas.

**Skirtumas tarp jų**

![Swift](../../RESOURCE/003_img6.png)

## Tekstas

SwiftUI aplinkoje `Text` naudojamas tekstui rodyti.

Pagrindinis naudojimas:

```swift
Text("FangJunyu")
```

Praeitoje pamokoje jau mokėmės `Text`, o šioje pamokoje dar giliau nagrinėsime, kaip valdyti šrifto dydį ir storį, kad tekstas vaizde būtų išraiškingesnis.

### Šrifto dydis

Naudojant `font` modifikatorių galima valdyti teksto dydį:

```swift
.font(.title)
```

Pavyzdžiui:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Dažniausiai naudojami šrifto dydžiai (nuo didžiausio iki mažiausio):

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Šrifto storis

Jei norime tekstą paryškinti, galima naudoti `fontWeight` modifikatorių:

```swift
.fontWeight(.bold)
```

Pavyzdžiui:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Dažniausiai naudojami šrifto storiai (nuo ploniausio iki storiausio):

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` valdo šrifto dydį, o `fontWeight` valdo šrifto storį. Abu galima naudoti kartu, kad tekstas būtų išraiškingesnis.

## Santrauka ir praktika

Iki šiol išmokome numatytąjį SwiftUI išdėstymą, `Spacer`, `Image` ir `Text` pagrindus. Šių žinių jau pakanka sukurti keletą paprastų vaizdų.

Pavyzdžiui: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google sąsaja yra labai švari, joje yra paveikslėlių ir teksto. Galime pabandyti pažvelgti į Google sąsajos struktūrą iš SwiftUI perspektyvos:

1. Visa sąsaja susideda iš trijų dalių: Google logotipo, paieškos laukelio ir pagalbinio teksto. Tai galima išdėstyti vertikaliai naudojant `VStack`.
2. Google logotipas yra paveikslėlis, todėl jį galima parodyti su `Image`.
3. Paieškos laukelyje yra įvesties laukas ir piktograma. Jei laikinai ignoruotume įvesties lauką, paieškos piktogramą būtų galima parodyti su `Image`.
4. Pagalbinis tekstas rodomas naudojant `Text`, o jo horizontalus išdėstymas gali būti kuriamas su `HStack`, o šrifto spalvą galima valdyti naudojant `foregroundStyle`.

Praktikuodami šias žinias galime kurti paprastus vaizdus ir taip geriau suprasti `Image`, `Text` vaizdus bei jų modifikatorių naudojimą。
