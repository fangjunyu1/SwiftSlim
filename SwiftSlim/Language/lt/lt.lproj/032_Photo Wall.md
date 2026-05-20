# Nuotraukų siena

Šioje pamokoje sukursime nuotraukų sienos puslapį.

![view](../../../Resource/032_view13.png)

Šiame pavyzdyje pakartosime `extension`, `self` ir egzempliorių žinias, taip pat išmoksime SwiftUI dažnai naudojamus `Shape` grafinius elementus.

Naudodami šias žinias, įprastas nuotraukas galėsime apkirpti į apskritimą, suapvalintą stačiakampį, kapsulės formą, elipsę ir kitus skirtingus stilius, taip pat pridėti nuotraukoms rėmelio efektą.

Šioje pamokoje naudosime kelias naujas sąvokas: `Shape`, `clipShape`, `strokeBorder` ir `overlay`.

Iš jų `clipShape` naudojamas rodinio formai apkirpti, `strokeBorder` naudojamas figūros rėmeliui piešti, o `overlay` naudojamas naujam rodiniui uždėti virš esamo rodinio.

## Nuotraukų ištekliai

Prieš pradėdami turime paruošti kelias nuotraukas.

Galite naudoti savo nuotraukas arba šioje pamokoje pateiktas pavyzdines nuotraukas.

Šios pamokos nuotraukų pavyzdžiai yra iš [Pixabay](https://pixabay.com/) svetainės:

[Peizažas](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg), [lapė](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg), [pastatas](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg), [gėlės](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg), [gulbė](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

Atsisiuntę nuotraukas, pridėkite jas į `Assets` išteklių aplanką ir iš eilės pavadinkite `1`, `2`, `3`, `4`, `5`.

![assets](../../../Resource/032_view17.png)

Taip SwiftUI galėsime rodyti nuotraukas naudodami `Image("1")`, `Image("2")` ir panašų būdą.

## Nuotraukų rodymas

Pirmiausia `ContentView` rodinyje parodysime 5 nuotraukas:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Rodomas rezultatas:

![view](../../../Resource/032_view.png)

Šiame kode naudojame `ScrollView`, kad nuotraukų sąrašą būtų galima slinkti, ir naudojame `VStack`, kad kelios nuotraukos būtų išdėstytos iš viršaus į apačią.

Kiekvienai nuotraukai per `.resizable()`, `.scaledToFit()` ir `.frame(width: 300)` nustatome rodymo efektą, kad nuotrauka galėtų būti keičiama, išlaikytų proporcijas ir būtų visiškai rodoma, o jos plotis būtų apribotas.

`VStack` pritaikytas `.padding(.vertical, 100)` naudojamas viršutiniam ir apatiniam tarpui padidinti, kad pirmoji ir paskutinė nuotrauka nebūtų per arti ekrano kraštų.

Pabaigoje esantis `.ignoresSafeArea()` reiškia, kad slinkimo rodinys ignoruoja saugiąją sritį, todėl slenkant nuotraukos gali tęstis iki ekrano viršaus ir apačios, o puslapis atrodo pilnesnis.

Tačiau dabar visoms 5 nuotraukoms naudojami tie patys modifikatoriai:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

Kai matome pasikartojantį kodą, galime apsvarstyti galimybę jį sutvarkyti naudodami `extension`.

## Nuotraukų stiliaus tvarkymas naudojant extension

Galime `Image` tipui išplėsti specialų nuotraukų sienos metodą:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Čia `Image` tipui pridėjome `photoGalleryStyle` metodą.

Šio metodo viduje yra anksčiau pakartotinai naudoti `.resizable()`, `.scaledToFit()` ir `.frame(width: 300)`. Kitaip tariant, jis sujungia nuotraukos mastelio keitimo, proporcingo rodymo ir pločio nustatymo kodą į vieną vietą.

Panaudojus šį išplėtimą, ankstesnis nuotraukos kodas:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

gali būti supaprastintas taip:

```swift
Image("1")
    .photoGalleryStyle()
```

Taip kiekvienai nuotraukai tereikia iškviesti `.photoGalleryStyle()`, kad būtų pritaikytas tas pats nuotraukų sienos stilius. Kodas tampa glaustesnis, o vėliau jį patogiau vieningai keisti.

## self supratimas

Išplėtimo metode parašėme `self`:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

Čia `self` reiškia dabartinį nuotraukos egzempliorių, kuris iškvietė šį metodą.

Pavyzdžiui:

```swift
Image("1")
    .photoGalleryStyle()
```

Šiame kode `photoGalleryStyle()` iškviečia `Image("1")`, todėl metodo viduje esantis `self` reiškia šią `Image("1")` nuotrauką.

Galima paprastai suprasti taip: kas iškviečia šį metodą, tą ir reiškia `self`.

Reikia atkreipti dėmesį, kad SwiftUI modifikatoriai nuolat grąžina naujus rodinio rezultatus. Todėl `photoGalleryStyle()` grąžina modifikuotą rodinį, o ne tiesiog pradinį `Image`.

## Nuotraukų formos

Dabar nuotraukos jau gali būti rodomos įprastai. Tačiau pagal numatymą jos visos yra stačiakampės ir atrodo gana paprastai.

Jei norime tik suteikti nuotraukai suapvalintus kampus, galime tiesiog naudoti `.cornerRadius()`:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

Rodomas rezultatas:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` reiškia, kad nuotraukai pridedami `20 pt` suapvalinti kampai. Įprastai suapvalintai nuotraukai tokios rašybos jau pakanka.

Tačiau `.cornerRadius()` gali apdoroti tik suapvalintų kampų efektą ir tinka įprastoms suapvalintoms nuotraukoms kurti. Jei norime, kad nuotrauka taptų daugiau skirtingų formų, vien šio modifikatoriaus nepakanka.

Tada reikia naudoti SwiftUI `Shape`. `Shape` gali aprašyti skirtingas figūras, o kartu su `clipShape` galima apkirpti nuotrauką į atitinkamą formą.

## Susipažinimas su Shape

SwiftUI sistemoje `Shape` reiškia figūrą. Kaip ir `View`, tai taip pat yra labai dažnai naudojamas SwiftUI tipas.

Dažniausiai pasitaikantys `Shape` yra apskritimas, stačiakampis, suapvalintas stačiakampis, kapsulė ir elipsė. Kad būtų lengviau stebėti skirtingų figūrų išvaizdą, toliau pateiktuose pavyzdžiuose kiekvienai figūrai nustatysime skirtingą spalvą ir dydį.

Šiuose pavyzdžiuose `.fill()` naudojamas figūrai užpildyti spalva, o `.frame()` naudojamas figūros rodymo dydžiui nustatyti. Spalva skirta tik skirtingoms figūroms atskirti ir nėra pačios figūros fiksuota spalva.

### Circle apskritimas

`Circle` reiškia apskritimą. Jis dažnai naudojamas avatarams, apvaliems mygtukams, apvalioms nuotraukoms ir kitiems sąsajos efektams.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle stačiakampis

`Rectangle` reiškia stačiakampį. Tai viena iš pagrindinių figūrų, taip pat naudojama fonams, sričių atskyrimui arba įprastiems rėmeliams kurti.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle suapvalintas stačiakampis

`RoundedRectangle` reiškia suapvalintą stačiakampį. `cornerRadius` naudojamas kampų suapvalinimo dydžiui nustatyti.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule kapsulė

`Capsule` reiškia kapsulės formą. Jos abu galai yra lankiniai, todėl ji dažnai naudojama kapsulės formos mygtukams, žymų fonams ir kitiems sąsajos efektams.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse elipsė

`Ellipse` reiškia elipsę. Ji panaši į `Circle`, bet kai plotis ir aukštis skiriasi, rodoma kaip elipsė.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

Iš šių pavyzdžių matome, kad `Shape` pats gali būti tiesiogiai rodomas kaip figūra. Toliau naudosime šiuos `Shape` kartu su `clipShape`, kad apkirptume nuotraukas ir jos būtų rodomos skirtingomis formomis.

## Nuotraukų apkirpimas naudojant clipShape

Dabar galime naudoti `clipShape`, kad apkirptume nuotraukas į skirtingas formas.

Pavyzdžiui, pirmąją nuotrauką apkirpkime į apskritimą:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

Šis kodas reiškia: pirmiausia parodoma nuotrauka, tada naudojant `Circle()` ji apkerpama į apskritimą.

![view](../../../Resource/032_view2.png)

Pagrindinė `clipShape` rašyba yra:

```swift
.clipShape(figūra)
```

Prie rodinio pridėkite `.clipShape(...)`, o skliaustuose įrašykite figūrą, į kurią norite apkirpti.

Pavyzdžiui:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

Dabar 5 nuotraukas atitinkamai apkirpsime į skirtingas formas:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Rodomas rezultatas:

![view](../../../Resource/032_view8.png)

Iš jų `Rectangle()` apkirpimo efektas yra artimas įprastai stačiakampei nuotraukai, todėl vizualinis pokytis nėra ryškus ir daugiausia naudojamas palyginimui su kitomis formomis.

Dabar nuotraukos nebėra tik įprasti stačiakampiai, jos turi skirtingas formas.

## Nuotraukos rėmelio pridėjimas

Jei norime apvaliai nuotraukai pridėti rėmelį, galime pagalvoti apie `border` naudojimą:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

Tačiau taip paprastai gaunamas ne apvalus rėmelis, o stačiakampis rėmelis.

![view](../../../Resource/032_view9.png)

Taip yra todėl, kad `border` rėmelį prideda pagal stačiakampę rodinio sritį, o ne pagal po `clipShape` apkirptą formą.

Todėl jei norime apvalaus rėmelio, negalime tiesiogiai naudoti `border`.

## Figūros rėmelio piešimas naudojant strokeBorder

SwiftUI sistemoje `strokeBorder` gali šioms įprastoms `Shape` figūroms nupiešti vidinį rėmelį.

Pavyzdžiui, nupieškime apskritą rėmelį:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

Šis kodas reiškia: `Circle` figūrai nupiešiamas rudas rėmelis, kurio plotis yra `10 pt`.

![view](../../../Resource/032_view12.png)

Čia reikia atkreipti dėmesį, kad `strokeBorder` tiesiogiai neprideda rėmelio nuotraukai, o nupiešia rėmelį `Circle()` figūrai.

Kitaip tariant, šis kodas sukuria tik nepriklausomą apskritą rėmelį, kuris dar nėra susijęs su nuotrauka.

Jei norime, kad šis apskritas rėmelis būtų rodomas virš nuotraukos, turime toliau naudoti `overlay` ir uždėti rėmelį ant nuotraukos.

## Rėmelio uždėjimas naudojant overlay

`overlay` yra rodinio modifikatorius, leidžiantis virš dabartinio rodinio uždėti naują rodinį.

Jo pagrindinę struktūrą galima suprasti taip:

```swift
dabartinis rodinys
    .overlay {
        uždedamas rodinys
    }
```

Šiame pavyzdyje dabartinis rodinys yra nuotrauka, jau apkirpta į apskritimą:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

Naujas rodinys, kurį norime uždėti, yra apskritas rėmelis:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

Todėl nuotrauką ir rėmelį galima sujungti taip:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

Čia `overlay` reiškia, kad virš dabartinio rodinio uždedamas naujas rodinys.

`overlay` viduje rėmelis uždedamas pagal dabartinės nuotraukos rodymo sritį, todėl atskirai nustatyti `frame` nebereikia. Kol rėmelio forma sutampa su apkirpimo forma, rėmelis gali tiksliai priglusti prie nuotraukos.

![view](../../../Resource/032_view10.png)

Galutinis rezultatas yra toks: ant apvalios nuotraukos uždengtas apskritas rėmelis.

Palyginti su `ZStack`, `overlay` labiau tinka scenarijams, kai „dabartiniam rodiniui pridedamas dekoravimas“. Nuotrauka yra pagrindinis objektas, o rėmelis tik papildomas efektas, todėl naudoti `overlay` yra aiškiau.

## Nuotraukų sienos užbaigimas

Dabar kiekvienai nuotraukai pridėsime atitinkamą formą ir rėmelį:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

Rodomas rezultatas:

![view](../../../Resource/032_view13.png)

Taip baigtas paprastas nuotraukų sienos puslapis.

Šiame puslapyje naudojome `ScrollView` slenkamam rodymui įgyvendinti, `Image` nuotraukoms rodyti, `clipShape` nuotraukų formai apkirpti, o per `overlay` ir `strokeBorder` pridėjome rėmelius.

## Pilnas kodas

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## Santrauka

Šioje pamokoje užbaigėme nuotraukų sienos puslapį.

![view](../../../Resource/032_view13.png)

Šiame pavyzdyje pirmiausia naudojome `Image` nuotraukoms rodyti, tada per `extension` išplėtėme `Image` tipą ir pridėjome `photoGalleryStyle` metodą, skirtą pasikartojančiam nuotraukų stiliaus kodui sutvarkyti.

Vėliau susipažinome su dažnai naudojamomis SwiftUI `Shape` figūromis, pavyzdžiui, `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` ir `Ellipse`. Šios figūros gali būti ne tik tiesiogiai rodomos, bet ir naudojamos kartu su `clipShape` rodiniui apkirpti.

Pavyzdžiui:

```swift
.clipShape(Circle())
```

reiškia, kad rodinys apkerpamas į apskritimą.

Galiausiai naudodami `overlay` ir `strokeBorder` nuotraukoms pridėjome atitinkamos formos rėmelius. Reikia atkreipti dėmesį, kad `border` paprastai piešia rėmelį pagal stačiakampę rodinio sritį. Jei norime, kad rėmelis sektų apskritimą, kapsulę ar elipsę, labiau tinka uždėti tą patį `Shape`.

Per šią pamoką ne tik sukūrėme nuotraukų sienos efektą, bet ir supratome įprastą `Shape`, `clipShape`, `strokeBorder` ir `overlay` derinimo būdą sąsajoje.

## Užduotys po pamokos

### 1. Pridėkite nuotraukų sienos foną

Nuotraukų sienos puslapiui pridėkite viso ekrano fono paveikslėlį.

Reikalavimas: fono paveikslėlis turi užpildyti visą ekraną ir ignoruoti saugiąją sritį.

### 2. Gradientinis rėmelis

Esamą vienspalvį rėmelį pakeiskite į linijinį gradientinį rėmelį.

Galite pabandyti naudoti `LinearGradient`, kad sukurtumėte sodresnį rėmelio efektą.

### 3. Tikroviško nuotraukos rėmelio imitacija

Internete paieškokite kelių tikrų nuotraukų rėmelių stilių ir pabandykite naudoti `overlay`, kad uždėtumėte paveikslėlio rėmelį, jog nuotrauka atrodytų panašesnė į tikrą rėmelį.

Pratimo rodomas rezultatas:

![button](../../../Resource/032_view15.jpeg)

### 4. Įgyvendinkite suapvalinto mygtuko rėmelį

Tikroje kūrimo praktikoje mygtukai dažnai naudoja suapvalinto stačiakampio rėmelius.

Pabandykite sukurti suapvalintą mygtuką ir naudoti `RoundedRectangle` bei `strokeBorder`, kad mygtukui pridėtumėte suapvalintą rėmelį.

Pratimo rodomas rezultatas:

![button](../../../Resource/032_view14.png)

### Klausimas apmąstymui

Jei nenorite naudoti vienspalvio rėmelio ir nenorite naudoti gradientinio rėmelio, o norite, kad rėmelis turėtų tam tikrą rašto efektą, kaip tai reikėtų įgyvendinti?

Galite pabandyti paieškoti medžiagos ir susipažinti su `overlay`, `mask`, `ImagePaint` ir kitais susijusiais naudojimo būdais.

Pratimo rodomas rezultatas:

![button](../../../Resource/032_view16.png)
