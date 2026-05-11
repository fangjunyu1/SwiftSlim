# Kurso kortelė

Ši pamoka yra etapo kartojimo pamoka. Sukursime „kurso kortelę“.

Atlikdami šį pratimą galime pakartoti anksčiau išmoktus `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` ir kitus dalykus, taip pat išmokti, kaip kelis mažus vaizdus sujungti į pilną vaizdo modulį.

Kurso kortelės efektas:

![view](../../../Resource/026_view.png)

Šią kurso kortelę daugiausia sudaro kelios dalys:

- Kurso lygis: `Beginner`
- Kurso turinys: `20+ Lessons`
- Kurso pavadinimas: `SwiftUI Beginner Tutorial`
- Kurso aprašymas
- Mygtukas: `Start Learning`
- Kurso fonas: Swift piktograma ir indigo spalvos fonas

Šį vaizdą galime sukurti `ContentView` viduje.

## Viršutinė sritis

Pirmiausia sukurkime viršutinę kurso kortelės sritį.

![view](../../../Resource/026_view1.png)

Viršutinės srities kairėje rodome kurso lygį, o dešinėje rodome kurso turinį.

Kadangi šie du elementai išdėstyti horizontaliai, galime naudoti `HStack`.

```swift
var topView: some View {
    HStack {
        Text("Pradedantiesiems")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ pamokų")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

Čia viršutinę sritį išskyrėme į skaičiuojamąją savybę:

```swift
var topView: some View
```

Tokio sprendimo privalumas yra tas, kad `body` tampa aiškesnis.

Viršutinėje srityje daugiausia naudojami šie dalykai:

- `HStack`: leidžia du tekstus išdėstyti horizontaliai.
- `Text`: rodo tekstinį turinį.
- `Spacer()`: nustumia kairįjį tekstą į kairę, o dešinįjį tekstą į dešinę.
- `.font(.footnote)`: nustato mažesnį teksto stilių.
- `.fontWeight(.bold)`: nustato paryškintą tekstą.
- `.foregroundStyle(Color.white)`: nustato priekinio plano spalvą į baltą.
- `.padding(.vertical, 10)`: nustato viršutinį ir apatinį vidinį atstumą.
- `.padding(.horizontal, 16)`: nustato kairįjį ir dešinįjį vidinį atstumą.
- `.background(Color.white.opacity(0.15))`: nustato pusiau permatomą baltą foną.
- `.cornerRadius(20)`: nustato kampų apvalinimą.

Čia `Beginner` naudoja `.padding()` dviem kryptimis:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

Taip tekstas gauna vietos ir vertikaliai, ir horizontaliai, todėl labiau primena žymą.

`Color.white.opacity(0.15)` reiškia baltą spalvą su `15%` nepermatomumu, tai yra labai švelnią baltą spalvą.

### Kortelės fono pridėjimas

Anksčiau sukūrėme `topView`, bet vien vaizdo sukūrimas nereiškia, kad jis automatiškai bus parodytas.

SwiftUI aplinkoje turinys, kuris iš tikrųjų rodomas ekrane, turi būti parašytas `body` viduje.

Todėl pirmiausia galime įdėti `topView` į `body`, kad jį parodytume:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

Šiuo metu matysime, kad viršutinė sritis jau rodoma:

![view](../../../Resource/026_view2.png)

Tačiau kadangi `topView` tekstas yra baltas, o numatytasis fonas taip pat šviesus, šviesiuoju režimu jį gali būti sunkiau aiškiai matyti.

Todėl išorėje galime pridėti `VStack`, o visai sričiai nustatyti vidinį atstumą, fono spalvą ir kampų apvalinimą:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

Rodomas rezultatas:

![view](../../../Resource/026_view3.png)

Čia `VStack` šiuo metu turi tik vieną `topView`, todėl gali atrodyti, kad jis nėra būtinas.

Tačiau vėliau toliau pridėsime kurso pavadinimą, kurso aprašymą ir mygtuko sritį. Visi jie bus išdėstyti vertikaliai, todėl iš anksto naudojamas `VStack` leis patogiau toliau jungti vaizdus.

Čia yra du `.padding()` modifikatoriai, ir jų paskirtys skiriasi.

Pirmasis `.padding(20)` parašytas prieš `.background()`:

```swift
.padding(20)
.background(Color.indigo)
```

Jis valdo kortelės vidinį atstumą, tai yra atstumą tarp turinio ir fono krašto.

Antrasis `.padding(30)` parašytas po `.background()`:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

Jis valdo kortelės išorinį atstumą, tai yra atstumą tarp visos kortelės ir ekrano krašto.

![view](../../../Resource/026_view4.png)

Taigi, nors abu yra `.padding()`, parašius juos skirtingose vietose, rezultatas taip pat bus skirtingas.

## Turinio sritis

Toliau sukurkime kurso kortelės turinio sritį.

Rodomas rezultatas:

![view](../../../Resource/026_view5.png)

Turinio srityje yra kurso pavadinimas ir kurso aprašymas. Jie išdėstyti vertikaliai, todėl naudojame `VStack`.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI pamoka pradedantiesiems")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("Pradėkite nuo nulio su SwiftUI ir sistemingai mokykitės deklaratyvaus Apple vartotojo sąsajų kūrimo. Aiškūs paaiškinimai ir praktiniai pavyzdžiai padės palaipsniui įvaldyti išdėstymą, sąveiką ir būsenos valdymą, kad galėtumėte kurti gražias ir naudingas programų sąsajas.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

Rodomas rezultatas:

![view](../../../Resource/026_view6.png)

Šiame `VStack` naudojami du parametrai:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` reiškia, kad `VStack` viduje esantys vaizdai lygiuojami prie vedančiojo krašto.

`spacing: 10` reiškia, kad tarp `VStack` viduje esančių vaizdų paliekamas `10 pt` tarpas.

Todėl kurso pavadinimas ir kurso aprašymas bus išdėstyti nuo kairės pusės, o tarp jų liks tam tikras atstumas.

Kurso aprašymas yra gana ilgas. Jei rodytume visą tekstą, kortelė taptų labai aukšta, todėl čia naudojame `.lineLimit()`, kad apribotume rodomų eilučių skaičių:

```swift
.lineLimit(3)
```

Tai reiškia, kad bus rodoma daugiausia `3` eilutės. Kai turinys viršija eilučių limitą, perteklinė dalis bus praleista.

### Vaizdo lygiavimas į kairę

Čia dar reikia atkreipti dėmesį į vieną dalyką.

`VStack(alignment: .leading)` gali valdyti tik `VStack` viduje esančių vaizdų lygiavimą. Jis tiesiogiai nevaldo paties `VStack` padėties išoriniame konteineryje.

Pavyzdžiui, jei kurso aprašymas gana trumpas:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI pamoka pradedantiesiems")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("Tiesiog šiek tiek turinio.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

Rodomas rezultatas:

![view](../../../Resource/026_view7.png)

Matome, kad nors kurso pavadinimas ir kurso aprašymas `VStack` viduje yra sulygiuoti į kairę, visas `VStack` nėra prispaustas prie kairiojo kortelės krašto.

Taip yra todėl, kad kai turinys trumpesnis, `VStack` plotis taip pat tampa gana siauras. Išorinis konteineris išdėstymo metu gali šį siauresnį `VStack` padėti centre.

Galima suprasti taip: `VStack(alignment: .leading)` atsakingas už vidinį lygiavimą į kairę.
Tačiau jis nėra atsakingas už visos turinio srities nustūmimą iki pat kairės.

Jei norime, kad visa turinio sritis iš tikrųjų būtų kairėje, galime ją apgaubti dar vienu `HStack` ir pridėti `Spacer()`:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI pamoka pradedantiesiems")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("Tiesiog šiek tiek turinio.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

Rodomas rezultatas:

![view](../../../Resource/026_view8.png)

Čia `HStack` yra horizontalus išdėstymas.

`Spacer()` užima dešinėje likusią erdvę ir taip nustumia kairėje esantį `VStack` iki pat kairės.

Todėl `HStack + Spacer()` galima naudoti visos turinio srities padėčiai valdyti.

Tikroje kurso kortelėje kurso aprašymas yra gana ilgas ir paprastai užima daugiau pločio, todėl ši problema nebūtinai bus akivaizdi. Tačiau svarbu suprasti šį skirtumą, nes vėliau kuriant trumpų tekstų išdėstymus dažnai pasitaiko panašių situacijų.

### Vidinių vaizdų atstumo valdymas

Anksčiau `VStack` viduje parašėme `spacing: 10`:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` naudojamas valdyti atstumui tarp vidinių vaizdų.

Jei `spacing` nenustatomas, `VStack` taip pat turi numatytąjį tarpą, bet numatytasis tarpas nebūtinai atitinka norimą rezultatą.

Čia, jei kurso pavadinimas ir kurso aprašymas būtų per arti vienas kito, išdėstymas atrodytų suspaustas, todėl naudojame:

```swift
spacing: 10
```

Taip tarp jų paliekama šiek tiek vietos.

Rodomas rezultatas:

![view](../../../Resource/026_view9.png)

Panašiai viršutinė sritis ir turinio sritis taip pat išdėstytos vertikaliai, todėl `spacing` galima naudoti ir jų atstumui valdyti.

Dabar įdėkime `topView` ir `contentView` į `body`:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Rodomas rezultatas:

![view](../../../Resource/026_view10.png)

Čia `VStack(spacing: 20)` valdo atstumą tarp `topView` ir `contentView`.

Kitaip tariant:

```swift
VStack(alignment: .leading, spacing: 10)
```

Valdo atstumą tarp kurso pavadinimo ir kurso aprašymo.

```swift
VStack(spacing: 20)
```

Valdo atstumą tarp viršutinės srities ir turinio srities.

Abu yra `spacing`, tačiau jie veikia skirtingus `VStack`, todėl jų poveikio sritis taip pat skiriasi.

Taip turinio srities vaizdas baigtas.

## Mygtuko sritis

Toliau sukurkime apatinę mygtuko sritį.

Rodomas rezultatas:

![view](../../../Resource/026_view11.png)

Mygtuko sritį daugiausia sudaro paleidimo piktograma ir tekstas.

Galime naudoti `Image`, kad parodytume paleidimo piktogramą, ir `Text`, kad parodytume mygtuko tekstą.

Čia pirmiausia sukuriame mygtuko išvaizdą:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("mygtukas paspaustas")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("Pradėti mokytis")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

Rodomas rezultatas:

![view](../../../Resource/026_view12.png)

Čia naudojami du `HStack`:

Vidinis `HStack` naudojamas piktogramai ir tekstui išdėstyti horizontaliai:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("Pradėti mokytis")
}
```

Išorinis `HStack` kartu su `Spacer()` naudojamas tam, kad mygtuko išvaizda būtų sulygiuota į kairę:

```swift
HStack {
    ...
    Spacer()
}
```

Paspaudus mygtuką, konsolėje bus išvestas tekstas `mygtukas paspaustas`.

## Bazinė kortelė baigta

Dabar sujunkime viršutinę sritį, turinio sritį ir mygtuko sritį:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Rodomas rezultatas:

![view](../../../Resource/026_view13.png)

Iki čia bazinė kurso kortelė jau baigta.

## Swift piktogramos fonas

Galiausiai kortelei pridėkime pusiau permatomą Swift piktogramos foną.

![view](../../../Resource/026_view.png)

Anksčiau kaip foną naudojome `Color.indigo`. Iš tikrųjų `.background()` gali pridėti ne tik spalvą, bet ir pilną vaizdą.

Todėl pirmiausia galime sukurti specialų fono vaizdą:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

Šiame fono vaizde naudojame `VStack`, `HStack` ir `Spacer()`, kad nustumtume Swift piktogramą į apatinį dešinįjį kampą.

Kadangi Swift piktograma naudojama tik kaip dekoratyvinis fonas, čia naudojama pusiau permatoma balta spalva:

```swift
Color.white.opacity(0.15)
```

Taip piktograma nebus per daug ryški ir netrukdys priekyje esančiam tekstiniam turiniui.

Tada pridėkime `backgroundView` prie kortelės:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

Galutinis rezultatas:

![view](../../../Resource/026_view14.png)

Čia iš eilės naudojami du `.background()` modifikatoriai:

```swift
.background(backgroundView)
.background(Color.indigo)
```

Pirmasis `.background()` naudojamas Swift piktogramos fonui pridėti.
Antrasis `.background()` naudojamas indigo spalvos fonui pridėti.

Taip Swift piktograma rodoma virš indigo spalvos fono ir tampa kortelės fono dalimi.

Iš čia matome, kad `.background()` gali pridėti ne tik spalvas, bet ir pasirinktinius vaizdus. Keli `.background()` modifikatoriai taip pat gali būti derinami, kad sukurtų turtingesnius fono efektus.

Iki čia pilna kurso kortelė baigta.

## Santrauka

Šioje pamokoje per kurso kortelę pakartojome dažnus pagrindinius SwiftUI išdėstymo būdus.

Naudojome `Text` tekstui rodyti, `Image` sistemos piktogramai rodyti, o `VStack`, `HStack` ir `Spacer()` — vaizdų išdėstymui valdyti.

Išmokome `.lineLimit()`, kuris gali apriboti didžiausią teksto rodomų eilučių skaičių. Kai turinys viršija limitą, perteklinė dalis praleidžiama.

Kartu taip pat pakartojome dažnai naudojamus modifikatorius, tokius kaip `.padding()`, `.background()`, `.cornerRadius()` ir `.foregroundStyle()`.

Baigę šią pamoką, jau galime kelis mažus vaizdus sujungti į pilną kortelės modulį.

Tai taip pat labai dažnas mąstymo būdas SwiftUI kūrime: pirmiausia suskaidyti vaizdus į mažas dalis, o tada sujungti jas į pilną sąsają.

## Pilnas kodas

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("Pradedantiesiems")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ pamokų")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI pamoka pradedantiesiems")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("Pradėkite nuo nulio su SwiftUI ir sistemingai mokykitės deklaratyvaus Apple vartotojo sąsajų kūrimo. Aiškūs paaiškinimai ir praktiniai pavyzdžiai padės palaipsniui įvaldyti išdėstymą, sąveiką ir būsenos valdymą, kad galėtumėte kurti gražias ir naudingas programų sąsajas.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("mygtukas paspaustas")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("Pradėti mokytis")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
