# Prisijungimo vaizdas

Šioje pamokoje išmoksime labai praktišką scenarijų: prisijungimo vaizdą.

Nesvarbu, ar tai svetainė, ar programėlė, naudojantis dažnai reikia, kad vartotojas prisijungtų prie savo paskyros ir įvestų slaptažodį.

Pavyzdžiui, GitHub prisijungimo puslapis:

![WordPress](../../Resource/019_github.png)

Šioje pamokoje sukursime panašų prisijungimo vaizdą, kad vartotojas galėtų rankiniu būdu įvesti paskyrą ir slaptažodį, o mes patikrintume, ar įvestame turinyje nėra problemų.

## Viršutinis išdėstymas

Prisijungimo vaizdo kodą rašysime `ContentView` faile.

Pirmiausia parašykime žymėjimo sritį prisijungimo vaizdo viršuje. Gali iš anksto paruošti tinkamą piktogramos paveikslėlį ir įdėti jį į `Assets` aplanką.

![icon](../../Resource/019_icon1.png)

Tada naudok `Image` ir modifikatorius paveikslėliui rodyti:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Šie modifikatoriai reiškia:

- `resizable()`: leidžia keisti paveikslėlio dydį.
- `scaledToFit()`: keičia paveikslėlio dydį išlaikant jo pradinį santykį.
- `frame(width: 100)`: nustato rodomo paveikslėlio plotį į `100`.

Toliau naudok `Text` ir modifikatorius prisijungimo pavadinimui rodyti:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Po to naudok `VStack`, kad paveikslėlis ir tekstas būtų išdėstyti vertikaliai:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Rezultatas:

![view](../../Resource/019_view.png)

Iki šios vietos jau užbaigėme prisijungimo vaizdo viršutinę pavadinimo sritį.

### Išdėstymo optimizavimas

Šiuo metu paveikslėlis ir pavadinimas pagal numatytuosius nustatymus yra bendro išdėstymo vidurinėje srityje.

Jei norime, kad jie labiau primintų „prisijungimo ženklą puslapio viršuje“, galime naudoti `Spacer()`, kad išplėstume likusią erdvę ir parodytume turinį arčiau viršaus.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Rezultatas:

![view](../../Resource/019_view1.png)

Tačiau dabar `Image` ir `Text` atsidūrė per arti ekrano viršaus, todėl atrodo kiek ankšta.

Tokiu atveju galime naudoti `padding`, kad pridėtume viršutinį tarpą visam `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Rezultatas:

![view](../../Resource/019_view2.png)

Taip puslapio viršutinė pavadinimo sritis atrodo tinkamiau.

## Vartotojo vardas ir slaptažodis

Prisijungimo puslapis paprastai reikalauja, kad vartotojas įvestų vartotojo vardą ir slaptažodį.

SwiftUI sistemoje galime naudoti `TextField`, kad priimtume vartotojo įvedamą turinį.

Tačiau svarbu atkreipti dėmesį: `TextField` pats ilgą laiką neišsaugo įvestų duomenų, tai tik įvesties valdiklis. Tai, kas iš tikrųjų saugo šį įvestą turinį, yra kintamieji, kuriuos su juo susiejame.

Todėl pirmiausia turime sukurti du `@State` kintamuosius vartotojo vardui ir slaptažodžiui saugoti:

```swift
@State private var user = ""
@State private var password = ""
```

Kai `@State` kintamojo reikšmė pasikeičia, SwiftUI automatiškai atnaujina susijusius vaizdus.

Toliau naudok `TextField`, kad susietum šiuos du kintamuosius:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Čia `$user` ir `$password` reiškia „binding“.

Tai reiškia, kad kai vartotojas rašo tekstą į įvesties lauką, kintamojo reikšmė keičiasi tuo pačiu metu; o kai pasikeičia kintamojo reikšmė, sinchroniškai pasikeičia ir įvesties lauke rodomas turinys.

Šis ryšys, kai „vaizdas ir duomenys sinchronizuojasi tarpusavyje“, ir yra vadinamas binding.

Atkreipk dėmesį, kad čia reikia naudoti rašymą su `$`:

```swift
$user
```

Nes `TextField` reikia ne paprastos eilutės, o binding reikšmės, kuri „gali keisti duomenis į abi puses“.

### Įvesties laukų rodymas

Įdėkime juos į `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Rodomas rezultatas:

![view](../../Resource/019_view3.png)

Kadangi dabar `user` ir `password` abu pagal numatytuosius nustatymus yra tuščios eilutės:

```swift
""
```

todėl įvesties lauke pirmiausia bus rodomas placeholder tekstas, pavyzdžiui:

```swift
input user
```

Šis tekstas tik pasako vartotojui, „ką reikėtų įvesti čia“, ir nėra tikrasis įvestas turinys.

### Įvesties laukų optimizavimas

Dabar įvesties laukus jau galima naudoti, bet numatytasis stilius yra gana paprastas.

Kad sąsaja būtų aiškesnė, galime pridėti pavadinimą prieš įvesties lauką ir šiek tiek paprastai stilizuoti patį lauką.

Pavyzdžiui, pirmiausia pridėkime pavadinimą:

```swift
Text("Username")
    .fontWeight(.bold)
```

Po to naudok `HStack`, kad pavadinimą ir įvesties lauką padėtum toje pačioje eilutėje:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Čia naudojame `HStack`, nes norime „rodyti pavadinimą kairėje, o įvesties lauką dešinėje“.

Reikia atkreipti dėmesį, kad `TextField` pagal numatytuosius nustatymus užima likusią laisvą erdvę.

![color](../../Resource/019_view6.png)

Kad dviejų įvesties laukų dydis būtų vienodesnis, galime naudoti `frame(width:)`, kad nustatytume plotį, ir įvesties laukai atrodys tvarkingiau.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Po to pridėk ir rėmelį, kad įvesties laukas būtų aiškiau matomas:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Dabar pridėkime ir vartotojo vardą, ir slaptažodį į `ContentView` vaizdą:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Rodomas rezultatas:

![view](../../Resource/019_view4.png)

Iki šios vietos vartotojas jau gali įvesti vartotojo vardą ir slaptažodį.

## Prisijungimo mygtukas

Toliau po įvesties laukais pridėsime prisijungimo mygtuką.

```swift
Button("Sign in") {

}
```

Po to naudok `buttonStyle`, kad mygtukui suteiktum labiau pastebimą sistemos stilių:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Rodomas rezultatas:

![view](../../Resource/019_view5.png)

Kad įsitikintume, jog mygtukas tikrai reaguoja į bakstelėjimą, pirmiausia galime įrašyti `print` mygtuko viduje testavimui:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Kai mygtukas bakstelimas, konsolėje bus parodyta:

```swift
click Sign in
```

Tai rodo, kad mygtukas jau sėkmingai sureagavo į bakstelėjimo veiksmą.

## Prisijungimo logika

Dabar prie prisijungimo mygtuko pridėsime pačią pagrindinę tikrinimo logiką: **patikrinti, ar vartotojas įvedė vartotojo vardą ir slaptažodį**.

Norime įgyvendinti tokias situacijas:

- Jei vartotojas nieko neįveda, išvesti `Empty`
- Jei vartotojas įveda tik vieną iš jų, nurodyti, ko trūksta
- Jei įvesti ir vartotojo vardas, ir slaptažodis, išvesti `Success`

### Neįvesta jokios informacijos

Kadangi `user` ir `password` pagal numatytuosius nustatymus abu yra tuščios eilutės:

```swift
@State private var user = ""
@State private var password = ""
```

todėl kai vartotojas nieko neįveda, jos ir toliau lieka tuščios.

Swift kalboje tokie tipai kaip `String` gali naudoti `isEmpty`, kad nustatytų, ar turinys tuščias.

### Savybė isEmpty

`isEmpty` dažnai naudojama tikrinti, ar eilutės, masyvai ir kitas turinys yra tušti.

Pavyzdžiui:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Jei turinys tuščias, `isEmpty` grąžina `true`; jei turinys nėra tuščias, grąžina `false`.

Todėl galime ją naudoti nustatyti, ar vartotojo vardas ir slaptažodis turi įvestą turinį.

### isEmpty naudojimas kintamiesiems tikrinti

Jei vartotojas neįvedė jokios informacijos, tada:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Tuo metu sąlygą galime parašyti taip:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Šis kodas reiškia: jei `user` yra tuščias ir `password` taip pat yra tuščias, tada išvesk:

```swift
Empty
```

Čia `&&` yra loginis operatorius ir reiškia „ir“.

Tai yra, visa sąlyga yra teisinga tik tada, kai kairėje pusėje esanti sąlyga yra teisinga ir dešinėje pusėje esanti sąlyga taip pat yra teisinga.

Todėl šis kodas bus vykdomas tik tada, kai ir vartotojo vardas, ir slaptažodis bus tušti.

## Vartotojas užpildė tik dalį

Toliau panagrinėkime kitą situaciją: vartotojas įvedė tik vartotojo vardą arba tik slaptažodį.

Pavyzdžiui:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Šiuo metu vartotojo vardas nėra tuščias, bet slaptažodis yra tuščias.

Toliau galime naudoti `isEmpty`, kad tai patikrintume:

### Situacija, kai vartotojas įvedė paskyrą arba slaptažodį

Jei vartotojas įvedė tik vartotojo vardą arba tik slaptažodį, turime pateikti atitinkamą pranešimą apie tai, ko trūksta.

Pavyzdžiui, jei vartotojas įvedė tik vartotojo vardą:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Šio kodo logika yra tokia: jei vartotojo vardas tuščias, paprašyk įvesti vartotojo vardą. Priešingu atveju patikrink, ar slaptažodis tuščias, ir jei jis tuščias, paprašyk įvesti slaptažodį.

### Vartotojas užpildė visą informaciją

Jei ir vartotojo vardas, ir slaptažodis jau įvesti, tada `isEmpty` abiem atvejais grąžins `false`.

Tada galime tai parašyti taip:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Čia `!` reiškia „neigimą“.

Pavyzdžiui:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Tai reiškia, kad `user.isEmpty` naudojama nustatyti, „ar vartotojo vardas tuščias“, o `!user.isEmpty` naudojama nustatyti, „ar vartotojo vardas nėra tuščias“.

Slaptažodis laikosi tos pačios logikos.

Taigi šio kodo reikšmė yra tokia: vartotojo vardas nėra tuščias, ir slaptažodis taip pat nėra tuščias.

Kai abi šios sąlygos yra teisingos, rezultatas bus:

```swift
Success
```

## Pilna tikrinimo logika

Dabar sujunkime šias tris situacijas ir įrašykime jas į `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

Šio kodo vykdymo tvarką galima suprasti taip:

Pirmiausia tikriname:

```swift
if user.isEmpty && password.isEmpty
```

Jei ir vartotojo vardas, ir slaptažodis yra tušti, tiesiogiai išves `Empty`.

Jei abu nėra tušti, toliau tikriname šią eilutę:

```swift
else if user.isEmpty || password.isEmpty
```

Čia `||` reiškia „arba“.

Tai yra, kol bent viena sąlyga yra teisinga, visa sąlyga yra teisinga.

Todėl, kol vartotojo vardas tuščias arba slaptažodis tuščias, bus vykdomas `else if` kodo blokas.

Patekę į kodo bloką, toliau tikriname, kuris įvesties laukas tiksliai liko neužpildytas:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Jei nė viena iš dviejų ankstesnių sąlygų nėra teisinga, tai reiškia, kad vartotojo vardas nėra tuščias, ir slaptažodis taip pat nėra tuščias.

Tada programa pereis į paskutinį `else`:

```swift
print("Success")
```

Tokiu būdu mes užbaigiame pačią pagrindinę prisijungimo įvesties tikrinimo logiką.

## Vartotojo vardo ir slaptažodžio tikrinimas

Aukščiau pateikta logika tik tikrina, „ar buvo įvestas turinys“.

Tačiau tikroje programėlėje vien tik įvesti turinį nepakanka. Dažniausiai dar reikia išsiųsti vartotojo vardą ir slaptažodį į serverį patikrai.

Jei serveris patvirtina, kad vartotojo vardas egzistuoja ir slaptažodis teisingas, jis leis prisijungti; priešingu atveju praneš, kad prisijungti nepavyko.

Kad pasipraktikuotume šį procesą, pirmiausia galime kode nustatyti laikiną paskyrą ir slaptažodį, kad imituotume „teisingą prisijungimo informaciją“:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Kai ir vartotojo vardas, ir slaptažodis nėra tušti, tada palyginame, ar jie teisingi:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Čia `==` reiškia „ar lygu“.

Pavyzdžiui:

```swift
user == userID
```

Tai reiškia: ar vartotojo įvestas vartotojo vardas visiškai sutampa su teisingu vartotojo vardu, kurį mes nustatėme? Slaptažodžio tikrinimas vyksta pagal tą pačią logiką.

Todėl, kai įvestas vartotojo vardas ir slaptažodis yra lygūs nustatytoms reikšmėms, rezultatas bus `Success`; kol bent vienas iš jų nėra lygus, rezultatas bus `Input error`.

Tokiu būdu mes užbaigiame paprastą „imituotą prisijungimo tikrinimą“.

Nors tai dar nėra tikra prisijungimo funkcija, sujungta su serveriu, to jau visiškai pakanka, kad padėtų mums suprasti: **po to, kai mygtukas bakstelimas, pagal skirtingas sąlygas gali būti vykdomas skirtingas kodas**.

## Santrauka

Šioje pamokoje užbaigėme pagrindinį prisijungimo vaizdą ir ypač susitelkėme į „įvesto turinio vertinimo pagal sąlygas logiką“.

Pagrindinis šios pamokos turinys yra: `isEmpty` naudojimas nustatyti, ar eilutė tuščia, ir `if` sakinių naudojimas kartu su loginiais operatoriais skirtingoms situacijoms apdoroti.

Tarp jų yra du labai svarbūs loginiai operatoriai:

- `&&`: reiškia „ir“, abi sąlygos turi būti įvykdytos
- `||`: reiškia „arba“, pakanka, kad būtų įvykdyta viena sąlyga

Kai šios sąlygos galiausiai grąžina `true` arba `false`, `if` sakinys vykdo skirtingą kodą pagal rezultatą.

Per šį prisijungimo vaizdą mes jau pradėjome susipažinti su kūrimo būdu, kuris apjungia „sąsają + duomenis + loginį vertinimą“.

## Pilnas kodas

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
