# Raspored, slike i tekst

U prošloj smo lekciji učili kod za `ContentView`:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

U ovoj ćemo lekciji naučiti zadani mehanizam rasporeda u SwiftUI-ju te kako koristiti slike i tekst. Na temelju prethodne lekcije dodatno ćemo razumjeti strukturu i način prikaza pogleda, a to znanje pomoći će nam u izradi osnovnih rasporeda sučelja.

## Zadani mehanizam rasporeda u SwiftUI-ju

Kada pregledamo `ContentView`, primijetit ćemo da su ikona i tekst poravnati po sredini, a ne raspoređeni od vrha prema dolje.

![Swift](../../RESOURCE/003_view.png)

Prema zadanim postavkama, način poravnanja `Stack` spremnika je `.center`, pa se podprikazi obično prikazuju centrirano.

### `Alignment` poravnanje

Jasno je da je centrirano poravnanje samo jedna vrsta poravnanja. Ako želimo lijevo ili desno poravnanje, trebamo koristiti `alignment` za kontrolu položaja prikaza.

```swift
alignment
```

U SwiftUI-ju se poravnanje obično pojavljuje u dva scenarija:

**1. Parametar poravnanja unutar `Stack` spremnika**

Na primjer, lijevo poravnanje ikone i teksta u `ContentView`:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`alignment` u `VStack`-u kontrolira poravnanje u vodoravnom smjeru.

Načini poravnanja:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` je vodoravni raspored, pa `alignment` kontrolira poravnanje u okomitom smjeru:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` je slojeviti raspored, a `alignment` može kontrolirati vodoravno ili okomito poravnanje:

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

Ako se `alignment` ne navede izričito, `VStack`、`HStack` i `ZStack` koriste `.center`.

**2. `alignment` unutar `frame`**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

Kada je veličina koju `frame` pruža veća od stvarne veličine prikaza, `alignment` određuje položaj prikaza unutar tog `frame`-a. Konkretnu upotrebu `frame`-a objasnit ćemo kasnije; ovdje je dovoljno osnovno upoznavanje.

### `Spacer` i mehanizam raspodjele prostora

`alignment` može prikaze rasporediti vodoravno ili okomito. Međutim, kada želimo da se tekst i slika nalaze na suprotnim krajevima, samo poravnanje nije dovoljno.

Na primjer, ako želimo napraviti gornji dio stranice [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/), s ikonom NHK-a lijevo i ikonom izbornika desno.

![Swift](../../RESOURCE/003_alignment3.png)

Ako koristimo samo `alignment`, obje će se ikone prikazati samo s jedne strane. Ne možemo ih rasporediti lijevo i desno, pa nam treba `Spacer` za raspodjelu preostalog prostora.

`Spacer` je fleksibilni prikaz za raspored koji može automatski popuniti preostali prostor.

Način korištenja:

```swift
Spacer()
```

Na primjer:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

Kada dodamo `Spacer` između `Image` i `Text`, `Spacer` popunjava preostali prostor i gura `Image` i `Text` prema gornjem i donjem rubu.

![Swift](../../RESOURCE/003_view1.png)

Ako postoji više `Spacer` prikaza:

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

Preostali prostor bit će ravnomjerno raspodijeljen između svih `Spacer` prikaza.

![Swift](../../RESOURCE/003_spacer.png)

## Prikaz slike i kontrola veličine

Prikaz `Image` uglavnom se koristi za prikaz slika. Ikone SF Symbols koje smo učili u prošloj lekciji samo su jedan od načina korištenja `Image`.

Način uporabe:

```swift
Image("imageName")
```

Unutar navodnika nalazi se naziv slike, bez potrebe za nastavkom datoteke.

### Prikaz slike

Najprije pripremimo jednu sliku.

![Swift](../../RESOURCE/003_img.jpg)

U Xcodeu odaberite mapu resursa `Assets` i povucite sliku u nju.

![Swift](../../RESOURCE/003_img1.png)

Zatim koristite `Image` u `ContentView` za prikaz slike:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

Napomena: SwiftUI `Image` ne podržava reprodukciju GIF animacija (može prikazati samo statični kadar).

### Kontrola veličine slike

U SwiftUI-ju se `Image` prema zadanim postavkama prikazuje u izvornoj veličini. Ako želite prilagoditi prikazanu veličinu slike, najprije trebate koristiti `resizable` kako bi se sadržaj slike mogao skalirati, a zatim koristiti `frame` za određivanje veličine rasporeda.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### Modifikator `resizable`

Modifikator `resizable` omogućuje slici da sudjeluje u skaliranju unutar rasporeda, umjesto da uvijek ostane u izvornoj veličini.

```swift
.resizable()
```

Tek nakon dodavanja `resizable()` `frame` zaista može promijeniti veličinu prikaza slike.

Ako izostavimo `resizable`:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` će samo dati prostor rasporedu, ali se stvarna veličina slike neće promijeniti.

### Modifikator `frame`

`frame(width:height)` koristi se za određivanje širine i visine prikaza.

Osnovna upotreba:

```swift
.frame(width: 10,height: 10)
```

Na primjer, postavimo sliku na širinu 300 i visinu 100 kako bi postala pravokutnik.

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Možemo postaviti i samo širinu ili samo visinu:

```swift
.frame(width: 200)
.frame(height: 100)
```

Kombinacija `resizable + frame` može fleksibilno kontrolirati veličinu prikaza slike u sučelju, a pritom zadržati mogućnost skaliranja.

### Omjer skaliranja: `scaledToFit` i `scaledToFill`

Kada pomoću `frame` postavimo širinu i visinu u neskladnom omjeru, slika se može rastegnuti i deformirati.

Ako želimo da se slika prilagodi dostupnom prostoru uz zadržavanje izvornog omjera, možemo koristiti `scaledToFit` ili `scaledToFill`.

**`scaledToFit`**

`scaledToFit` zadržava izvorni omjer slike i skalira je tako da se u potpunosti uklopi u dostupni prostor, bez obrezivanja:

```swift
.scaledToFit()
```

ili

```swift
.aspectRatio(contentMode: .fit)
```

Ovaj je način prikladan kada želimo prikazati cijelu sliku bez deformacije.

Ako svim slikama postavimo istu širinu i visinu, teško je izbjeći rastezanje.

Na primjer:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Bez postavljenog načina skaliranja slika se ne može prikazati u izvornom omjeru.

![Swift](../../RESOURCE/003_img4.png)

Postavljanje `scaledToFit` omogućuje slici da zadrži izvorni omjer.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**`scaledToFill`**

`scaledToFill` također zadržava omjer slike, ali ispunjava cijeli dostupni prostor. Ako se omjeri ne podudaraju, višak će biti odrezan:

```swift
.scaledToFill()
```

ili

```swift
.aspectRatio(contentMode: .fill)
```

Ovaj je način prikladan kada želimo da slika prekrije cijelo područje, na primjer kao pozadinska slika ili banner.

**Razlika između njih**

![Swift](../../RESOURCE/003_img6.png)

## Tekst

U SwiftUI-ju se `Text` koristi za prikaz teksta.

Osnovna upotreba:

```swift
Text("FangJunyu")
```

U prošloj smo lekciji već upoznali `Text`, a sada ćemo dodatno naučiti kako kontrolirati veličinu i debljinu fonta kako bi tekst bio izražajniji u prikazu.

### Veličina fonta

Modifikator `font` može kontrolirati veličinu teksta:

```swift
.font(.title)
```

Na primjer:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

Često korištene veličine fonta (od većih prema manjima):

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

### Debljina fonta

Ako želimo podebljati tekst, možemo koristiti modifikator `fontWeight`:

```swift
.fontWeight(.bold)
```

Na primjer:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

Često korištene debljine fonta (od tanjih prema debljima):

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

`font` kontrolira veličinu, a `fontWeight` debljinu fonta; mogu se koristiti zajedno kako bi tekst bio izražajniji.

## Sažetak i praksa

Do sada smo naučili zadani SwiftUI raspored, `Spacer`, `Image` i `Text` te druga osnovna znanja, a to je već dovoljno za razvoj nekih jednostavnih prikaza.

Na primjer: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Googleovo sučelje je vrlo čisto i uključuje slike i tekst. Možemo pokušati analizirati njegovu strukturu iz SwiftUI perspektive:

1. Cijelo sučelje može se podijeliti na tri dijela: Google ikona, polje za pretraživanje i tekstualna poruka. Za to se može koristiti `VStack`.
2. Google ikona je slika i može se prikazati pomoću `Image`.
3. Polje za pretraživanje sadrži polje za unos i ikonu; ako zanemarimo samo polje za unos, ikona pretraživanja može se prikazati pomoću `Image`.
4. Tekstualna poruka prikazuje se pomoću `Text`, za vodoravni raspored teksta može se koristiti `HStack`, a boja teksta može se kontrolirati pomoću `foregroundStyle`.

Vježbanjem ovih znanja možemo izraditi neke jednostavne prikaze i dodatno produbiti razumijevanje te primjenu `Image` i `Text` prikaza te njihovih modifikatora.
