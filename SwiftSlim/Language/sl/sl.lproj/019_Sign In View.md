# Pogled za prijavo

V tej lekciji se bomo naučili zelo praktičnega scenarija — pogleda za prijavo.

Ne glede na to, ali gre za spletno stran ali aplikacijo, mora uporabnik med uporabo v mnogih primerih vnesti račun in geslo ter se prijaviti.

Na primer prijavna stran GitHub:

![WordPress](../../Resource/019_github.png)

V tej lekciji bomo ustvarili podoben pogled za prijavo, tako da bo uporabnik lahko ročno vnesel račun in geslo ter preveril, ali je z vneseno vsebino kaj narobe.

## Zgornja postavitev

Kodo za pogled za prijavo bomo napisali v datoteki `ContentView`.

Najprej bomo ustvarili identifikacijsko območje na vrhu pogleda za prijavo. Najprej lahko pripravite ustrezno ikono in jo postavite v mapo `Assets`.

![icon](../../Resource/019_icon1.png)

Nato uporabite `Image` in modifikatorje za prikaz slike:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Ti modifikatorji pomenijo:

- `resizable()`: omogoča spreminjanje velikosti slike.
- `scaledToFit()`: sliko poveča ali pomanjša ob ohranitvi prvotnega razmerja.
- `frame(width: 100)`: nastavi prikazano širino slike na `100`.

Nato uporabite `Text` in modifikatorje za prikaz naslova prijave:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Potem uporabite `VStack`, da sliko in besedilo razporedite navpično:

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

Učinek:

![view](../../Resource/019_view.png)

Do tukaj smo dokončali območje naslova na vrhu pogleda za prijavo.

### Optimizacija postavitve

Zdaj sta slika in naslov privzeto postavljena v osrednji del celotne postavitve.

Če želimo, da bolj spominjata na »oznako prijave na vrhu strani«, lahko uporabimo `Spacer()`, da zapolnimo preostali prostor in vsebino premaknemo bližje vrhu.

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

Učinek:

![view](../../Resource/019_view1.png)

Toda zdaj sta `Image` in `Text` preblizu zgornjemu robu zaslona in delujeta nekoliko utesnjeno.

V tem primeru lahko uporabimo `padding`, da celotnemu `VStack` dodamo zgornji odmik.

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

Učinek:

![view](../../Resource/019_view2.png)

Tako je območje naslova na vrhu strani videti primerneje.

## Uporabniško ime in geslo

Stran za prijavo običajno zahteva, da uporabnik vnese uporabniško ime in geslo.

V SwiftUI lahko uporabimo `TextField` za sprejem vsebine, ki jo vnese uporabnik.

Vendar bodite pozorni: `TextField` sam po sebi dolgoročno ne shranjuje vnesenih podatkov, ampak je le vnosni kontrolnik. Tisto, kar te podatke dejansko shranjuje, so spremenljivke, ki jih povežemo z njim.

Zato moramo najprej ustvariti dve spremenljivki `@State`, s katerima bomo shranili uporabniško ime in geslo:

```swift
@State private var user = ""
@State private var password = ""
```

Ko se vrednost spremenljivke `@State` spremeni, SwiftUI samodejno osveži povezani pogled.

Nato uporabite `TextField` za povezavo teh dveh spremenljivk:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Tukaj `$user` in `$password` pomenita »povezavo«.

To pomeni, da se ob uporabnikovem tipkanju v vnosno polje spremenljivka hkrati spreminja; in ko se spremeni spremenljivka, se hkrati spremeni tudi vsebina, prikazana v vnosnem polju.

Ta odnos, v katerem se »pogled in podatki medsebojno sinhronizirajo«, je povezava.

Upoštevajte, da moramo tukaj uporabiti zapis z `$`:

```swift
$user
```

Ker `TextField` ne potrebuje navadnega niza, temveč vrednost povezave, ki »lahko podatke spreminja v obe smeri«.

### Prikaz vnosnih polj

Postavimo ju v `ContentView`:

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

Prikazani učinek:

![view](../../Resource/019_view3.png)

Ker sta `user` in `password` trenutno privzeto prazna niza:

```swift
""
```

Bo vnosno polje najprej prikazalo nadomestno besedilo, na primer:

```swift
input user
```

To besedilo uporabniku le nakaže, »kaj je treba tukaj vnesti«, in ni dejansko vnesena vsebina.

### Optimizacija vnosnih polj

Zdaj je vnosna polja že mogoče uporabljati, vendar je privzeti slog precej preprost.

Da bo vmesnik preglednejši, lahko pred vnosno polje dodamo naslov in nekoliko izboljšamo slog samega polja.

Na primer, najprej dodajmo naslov:

```swift
Text("Username")
    .fontWeight(.bold)
```

Nato uporabimo `HStack`, da naslov in vnosno polje postavimo v isto vrstico:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Tukaj uporabljamo `HStack`, ker želimo »levo prikazati naslov, desno pa vnosno polje«.

Treba je opozoriti, da `TextField` privzeto zasede preostali razpoložljivi prostor.

![color](../../Resource/019_view6.png)

Da bosta obe vnosni polji bolj enotne velikosti, lahko uporabimo `frame(width:)`, da jima nastavimo širino in poskrbimo, da bosta videti bolj urejeno.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Nato dodajmo rob, da bo vnosno polje bolj opazno:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Zdaj v pogled `ContentView` dodajmo tako uporabniško ime kot geslo:

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

Prikazani učinek:

![view](../../Resource/019_view4.png)

Do tega trenutka lahko uporabnik že vnese uporabniško ime in geslo.

## Gumb za prijavo

Nato pod vnosni polji dodajmo gumb za prijavo.

```swift
Button("Sign in") {

}
```

Nato uporabite `buttonStyle`, da gumbu dodate bolj izrazit sistemski slog:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Prikazani učinek:

![view](../../Resource/019_view5.png)

Da potrdimo, da gumb res reagira na klik, lahko najprej v gumb napišemo `print` za test:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Ko kliknete gumb, bo konzola izpisala:

```swift
click Sign in
```

To pomeni, da se gumb že uspešno odziva na klik.

## Logika prijave

Zdaj bomo gumbu za prijavo dodali najbolj osnovno logiko preverjanja: **preveriti, ali je uporabnik vnesel uporabniško ime in geslo**.

Želimo doseči naslednje primere:

- Če uporabnik ni vnesel ničesar, izpišemo `Empty`
- Če uporabnik vnese samo eno od teh dveh stvari, opozorimo, katera manjka
- Če sta vnesena tako uporabniško ime kot geslo, izpišemo `Success`

### Ni vnesenih nobenih informacij

Ker sta `user` in `password` privzeto prazna niza:

```swift
@State private var user = ""
@State private var password = ""
```

Ostaneta prazna tudi takrat, ko uporabnik ne vnese ničesar.

V Swiftu lahko tipi, kot je `String`, uporabljajo `isEmpty`, da preverijo, ali je vsebina prazna.

### Lastnost isEmpty

`isEmpty` se pogosto uporablja za preverjanje, ali so nizi, polja in druga vsebina prazni.

Na primer:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Če je vsebina prazna, `isEmpty` vrne `true`; če vsebina ni prazna, `isEmpty` vrne `false`.

Zato ga lahko uporabimo za ugotavljanje, ali sta uporabniško ime in geslo vnesena.

### Uporaba isEmpty za preverjanje spremenljivk

Če uporabnik ni vnesel nobenih informacij, potem:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Takrat lahko pogoj zapišemo tako:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Ta koda pomeni: če je `user` prazen in je tudi `password` prazen, izpišemo:

```swift
Empty
```

Tukaj je `&&` logični operator, ki pomeni »in«.

To pomeni, da je celoten pogoj resničen samo takrat, ko sta resnična tako levi kot desni pogoj.

Zato se ta koda izvede samo, ko sta uporabniško ime in geslo oba prazna.

## Uporabnik je izpolnil samo del

Nato razmislimo o drugi situaciji: uporabnik je izpolnil samo uporabniško ime ali samo geslo.

Na primer:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Takrat uporabniško ime ni prazno, geslo pa je prazno.

Za preverjanje lahko še naprej uporabljamo `isEmpty`:

### Primer, ko uporabnik vnese račun ali geslo

Če uporabnik vnese samo uporabniško ime ali samo geslo, moramo prikazati ustrezno opozorilo o tem, kaj manjka.

Na primer, če je uporabnik vnesel samo uporabniško ime:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logika te kode je: če je uporabniško ime prazno, zahtevamo vnos uporabniškega imena. Sicer preverimo, ali je geslo prazno; če je prazno, zahtevamo vnos gesla.

### Uporabnik je vnesel vse informacije

Če sta uporabniško ime in geslo že vnesena, potem `isEmpty` za oba vrne `false`.

Takrat lahko to zapišemo takole:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Tukaj `!` pomeni »negacijo«.

Na primer:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

To pomeni, da se `user.isEmpty` uporablja za preverjanje, »ali je uporabniško ime prazno«, medtem ko se `!user.isEmpty` uporablja za preverjanje, »ali uporabniško ime ni prazno«.

Za geslo velja enaka logika.

Pomen te kode je torej: uporabniško ime ni prazno in tudi geslo ni prazno.

Ko sta ta dva pogoja izpolnjena, se izpiše:

```swift
Success
```

## Popolna logika preverjanja

Zdaj združimo te tri situacije in jih zapišimo v `Button`:

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

Zaporedje izvajanja te kode lahko razumemo tako:

Prvi korak je, da najprej preverimo:

```swift
if user.isEmpty && password.isEmpty
```

Če sta uporabniško ime in geslo oba prazna, se neposredno izpiše `Empty`.

Če oba nista prazna, program nadaljuje s preverjanjem naslednje vrstice:

```swift
else if user.isEmpty || password.isEmpty
```

Tukaj `||` pomeni »ali«.

To pomeni, da je celoten izraz resničen, dokler je resničen vsaj eden od pogojev.

Zato se bo blok kode `else if` izvedel vedno, ko je uporabniško ime prazno ali geslo prazno.

Ko vstopimo v blok kode, dodatno preverimo, katero vnosno polje ni bilo izpolnjeno:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Če prva dva pogoja nista izpolnjena, to pomeni, da uporabniško ime ni prazno in tudi geslo ni prazno.

Takrat program vstopi v zadnji `else`:

```swift
print("Success")
```

Tako smo dokončali najbolj osnovno logiko preverjanja vnosa za prijavo.

## Preverjanje uporabniškega imena in gesla

Zgornja logika preverja le, »ali je bil vnesen kakršen koli vsebinski podatek«.

V resnični aplikaciji pa samo vnos vsebine ni dovolj. Običajno je treba uporabniško ime in geslo poslati tudi na strežnik za preverjanje.

Če strežnik potrdi, da uporabniško ime obstaja in da je geslo pravilno, se prijava dovoli; sicer se prikaže obvestilo o neuspešni prijavi.

Za vajo lahko najprej v kodi nastavimo začasen račun in geslo ter s tem simuliramo »pravilne prijavne podatke«:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Ko uporabniško ime in geslo nista prazna, ju nato primerjamo, da preverimo, ali sta pravilna:

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

Tukaj `==` pomeni »ali sta enaka«.

Na primer:

```swift
user == userID
```

To pomeni, ali se uporabniško ime, ki ga vnese uporabnik, popolnoma ujema s pravilnim uporabniškim imenom, ki smo ga nastavili; za geslo velja enaka logika.

Zato se, ko se vneseno uporabniško ime in geslo ujemata z nastavljenimi vrednostmi, izpiše `Success`; če se katera koli od vrednosti ne ujema, se izpiše `Input error`.

Tako smo dokončali preprosto »simulirano preverjanje prijave«.

Čeprav to še ni prava prijavna funkcija, povezana s strežnikom, je že dovolj, da nam pomaga razumeti: **po kliku na gumb se lahko glede na različne pogoje izvede različna koda**.

## Povzetek

V tej lekciji smo dokončali osnovni pogled za prijavo in se posebej osredotočili na učenje »logike presojanja vnosa glede na pogoje«.

Glavna vsebina te lekcije je uporaba `isEmpty` za preverjanje, ali je niz prazen, ter uporaba stavka `if` skupaj z logičnimi operatorji za obravnavo različnih situacij.

Dva zelo pomembna logična operatorja sta:

- `&&`: pomeni »in«, izpolnjena morata biti oba pogoja
- `||`: pomeni »ali«, dovolj je, da je izpolnjen eden od pogojev

Ko ti pogoji na koncu dajo `true` ali `false`, stavek `if` glede na rezultat izvede različno kodo.

S tem pogledom za prijavo smo se že začeli srečevati z načinom razvoja, ki združuje »vmesnik + podatke + logično presojo«.

## Celotna koda

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
