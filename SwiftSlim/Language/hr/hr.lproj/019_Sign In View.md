# Prikaz prijave

U ovoj lekciji naučit ćemo jedan vrlo praktičan scenarij: prikaz prijave.

Bilo da se radi o web-stranici ili aplikaciji, tijekom korištenja korisnik se često mora prijaviti na svoj račun i unijeti lozinku.

Na primjer, GitHub stranica za prijavu:

![WordPress](../../Resource/019_github.png)

U ovoj lekciji izradit ćemo sličan prikaz prijave kako bi korisnik ručno unio račun i lozinku, a mi ćemo provjeriti postoji li problem u unesenom sadržaju.

## Gornji raspored

Kod za prikaz prijave napisat ćemo u datoteci `ContentView`.

Najprije napišimo područje oznake na vrhu prikaza prijave. Možete unaprijed pripremiti odgovarajuću sliku ikone i smjestiti je u mapu `Assets`.

![icon](../../Resource/019_icon1.png)

Zatim upotrijebite `Image` i modifikatore za prikaz slike:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Ti modifikatori znače:

- `resizable()`: omogućuje promjenu veličine slike.
- `scaledToFit()`: skalira sliku uz zadržavanje njezina izvornog omjera.
- `frame(width: 100)`: postavlja širinu prikazane slike na `100`.

Zatim upotrijebite `Text` i modifikatore za prikaz naslova prijave:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Nakon toga upotrijebite `VStack` da biste sliku i tekst rasporedili okomito:

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

Rezultat:

![view](../../Resource/019_view.png)

Do ovdje smo dovršili naslovno područje na vrhu prikaza prijave.

### Optimizacija rasporeda

Sada se slika i naslov prema zadanim postavkama nalaze u središnjem dijelu cijelog rasporeda.

Ako želimo da više izgledaju kao "oznaka prijave na vrhu stranice", možemo upotrijebiti `Spacer()` da proširimo preostali prostor i prikažemo sadržaj bliže vrhu.

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

Rezultat:

![view](../../Resource/019_view1.png)

Ali sada su `Image` i `Text` preblizu vrhu zaslona i izgledaju pomalo zbijeno.

U tom trenutku možemo upotrijebiti `padding` za dodavanje gornjeg razmaka cijelom `VStack`-u.

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

Rezultat:

![view](../../Resource/019_view2.png)

Tako gornje naslovno područje stranice izgleda prikladnije.

## Korisničko ime i lozinka

Stranica za prijavu obično zahtijeva od korisnika da unese korisničko ime i lozinku.

U SwiftUI-ju možemo koristiti `TextField` za primanje sadržaja koji korisnik unosi.

Ali važno je obratiti pažnju: `TextField` sam po sebi ne pohranjuje unesene podatke dugoročno, on je samo kontrola za unos. Ono što zaista pohranjuje te unesene podatke jesu varijable koje vežemo uz njega.

Zato prvo moramo stvoriti dvije `@State` varijable za spremanje korisničkog imena i lozinke:

```swift
@State private var user = ""
@State private var password = ""
```

Kada se vrijednost `@State` varijable promijeni, SwiftUI automatski osvježava povezane prikaze.

Zatim upotrijebite `TextField` za povezivanje tih dviju varijabli:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Ovdje `$user` i `$password` predstavljaju "binding".

To znači da se, kada korisnik upisuje tekst u polje za unos, vrijednost varijable mijenja u isto vrijeme; a kada se varijabla promijeni, sadržaj prikazan u polju za unos također se sinkrono mijenja.

Taj odnos, u kojem se "prikaz i podaci međusobno sinkroniziraju", naziva se binding.

Obratite pozornost da se ovdje mora koristiti zapis s `$`:

```swift
$user
```

Jer `TextField` ne treba običan niz znakova, nego binding vrijednost koja "može mijenjati podatke u oba smjera".

### Prikaz polja za unos

Stavimo ih u `ContentView`:

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

Prikaz rezultata:

![view](../../Resource/019_view3.png)

Budući da su `user` i `password` sada oba prazni nizovi prema zadanim postavkama:

```swift
""
```

polje za unos će najprije prikazati tekst rezerviranog mjesta, na primjer:

```swift
input user
```

Taj tekst samo korisniku daje do znanja "što ovdje treba unijeti", i nije stvarni uneseni sadržaj.

### Optimizacija polja za unos

Sada se polja za unos već mogu koristiti, ali zadani stil je prilično jednostavan.

Kako bi sučelje bilo jasnije, možemo dodati naslov ispred polja za unos i malo stilizirati samo polje za unos.

Na primjer, prvo dodajte naslov:

```swift
Text("Username")
    .fontWeight(.bold)
```

Zatim upotrijebite `HStack` da biste naslov i polje za unos postavili u isti red:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Ovdje koristimo `HStack` zato što želimo "prikazati naslov lijevo, a polje za unos desno".

Treba napomenuti da `TextField` prema zadanim postavkama zauzima preostali raspoloživi prostor.

![color](../../Resource/019_view6.png)

Kako bi veličina dvaju polja za unos bila ujednačenija, možemo koristiti `frame(width:)` za postavljanje širine, tako da polja za unos izgledaju urednije.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Zatim dodajte i obrub kako bi polje za unos bilo uočljivije:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Sada dodajmo i korisničko ime i lozinku u prikaz `ContentView`:

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

Prikaz rezultata:

![view](../../Resource/019_view4.png)

Do ovog trenutka korisnik već može unijeti korisničko ime i lozinku.

## Gumb za prijavu

Zatim ćemo dodati gumb za prijavu ispod polja za unos.

```swift
Button("Sign in") {

}
```

Zatim upotrijebite `buttonStyle` kako biste gumbu dodali uočljiviji sistemski stil:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Prikaz rezultata:

![view](../../Resource/019_view5.png)

Kako bismo potvrdili da gumb zaista reagira na dodir, najprije možemo upisati `print` unutar gumba radi testiranja:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Kada se gumb dodirne, konzola će ispisati:

```swift
click Sign in
```

To pokazuje da je gumb uspješno reagirao na dodir.

## Logika prijave

Sada ćemo gumbu za prijavu dodati najosnovniju logiku provjere: **provjeriti je li korisnik unio korisničko ime i lozinku**.

Želimo postići sljedeće situacije:

- Ako korisnik nije unio ništa, ispiši `Empty`
- Ako je korisnik unio samo jedno od toga, naznači što nedostaje
- Ako su uneseni i korisničko ime i lozinka, ispiši `Success`

### Nisu unesene nikakve informacije

Budući da su `user` i `password` prema zadanim postavkama oba prazni nizovi:

```swift
@State private var user = ""
@State private var password = ""
```

oni će ostati prazni kada korisnik ne unese ništa.

U Swiftu tipovi poput `String` mogu koristiti `isEmpty` za određivanje je li sadržaj prazan.

### Svojstvo isEmpty

`isEmpty` se često koristi za provjeru jesu li nizovi, polja i drugi sadržaji prazni.

Na primjer:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Ako je sadržaj prazan, `isEmpty` vraća `true`; ako sadržaj nije prazan, vraća `false`.

Zato ga možemo koristiti kako bismo odredili sadrže li korisničko ime i lozinka neki uneseni sadržaj.

### Korištenje isEmpty za provjeru varijabli

Ako korisnik nije unio nikakve informacije, tada:

```swift
user.isEmpty // true
password.isEmpty    // true
```

U tom trenutku uvjet možemo napisati ovako:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Ovaj kod znači: ako je `user` prazan i `password` je također prazan, ispiši:

```swift
Empty
```

Ovdje je `&&` logički operator i znači "i".

To jest, cijeli je uvjet istinit samo kada je uvjet s lijeve strane istinit i kada je uvjet s desne strane također istinit.

Zato će se ovaj kod izvršiti samo kada su i korisničko ime i lozinka prazni.

## Korisnik je ispunio samo dio

Zatim razmotrimo drugu situaciju: korisnik je ispunio samo korisničko ime ili samo lozinku.

Na primjer:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

U tom trenutku korisničko ime nije prazno, ali lozinka jest.

Možemo nastaviti koristiti `isEmpty` za provjeru:

### Situacija u kojoj je korisnik ispunio račun ili lozinku

Ako je korisnik ispunio samo korisničko ime ili lozinku, moramo dati odgovarajuću poruku o tome što nedostaje.

Na primjer, ako je korisnik ispunio samo korisničko ime:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logika ovog koda je: ako je korisničko ime prazno, zatraži unos korisničkog imena. U suprotnom provjeri je li lozinka prazna, i ako jest, zatraži unos lozinke.

### Korisnik je ispunio sve informacije

Ako su i korisničko ime i lozinka već uneseni, tada će `isEmpty` za oboje vratiti `false`.

U tom trenutku to možemo napisati ovako:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Ovdje `!` znači "negacija".

Na primjer:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

To znači da se `user.isEmpty` koristi za određivanje "je li korisničko ime prazno", dok se `!user.isEmpty` koristi za određivanje "nije li korisničko ime prazno".

Ista logika vrijedi i za lozinku.

Dakle, značenje ovog koda je: korisničko ime nije prazno, a ni lozinka nije prazna.

Kada su oba uvjeta istinita, izlaz će biti:

```swift
Success
```

## Potpuna logika provjere

Sada spojimo te tri situacije i napišimo ih unutar `Button`:

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

Redoslijed izvršavanja ovog koda možemo razumjeti ovako:

Prvi korak je najprije provjeriti:

```swift
if user.isEmpty && password.isEmpty
```

Ako su i korisničko ime i lozinka prazni, odmah će ispisati `Empty`.

Ako oboje nisu prazni, nastavit ćemo provjeravati ovaj redak:

```swift
else if user.isEmpty || password.isEmpty
```

Ovdje `||` znači "ili".

To jest, sve dok je jedan od uvjeta istinit, cijeli je uvjet istinit.

Zato će se blok koda `else if` izvršiti sve dok je korisničko ime prazno ili je lozinka prazna.

Nakon ulaska u blok koda, dodatno provjeravamo koje polje za unos točno nije ispunjeno:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Ako nijedan od prethodna dva uvjeta nije istinit, to znači da korisničko ime nije prazno, a ni lozinka nije prazna.

Tada će program ući u posljednji `else`:

```swift
print("Success")
```

Na taj način dovršili smo najosnovniju logiku provjere unosa za prijavu.

## Provjera korisničkog imena i lozinke

Gornja logika provjerava samo "je li sadržaj unesen ili nije".

Ali u stvarnoj aplikaciji nije dovoljno samo unijeti sadržaj. Obično također trebamo poslati korisničko ime i lozinku na poslužitelj radi provjere.

Ako poslužitelj potvrdi da korisničko ime postoji i da je lozinka ispravna, dopustit će prijavu; inače će obavijestiti da je prijava neuspješna.

Kako bismo uvježbali taj postupak, najprije možemo u kodu postaviti privremeni račun i lozinku kako bismo simulirali "točne podatke za prijavu":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Kada korisničko ime i lozinka nisu prazni, zatim ćemo ih usporediti da vidimo jesu li točni:

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

Ovdje `==` znači "je li jednako".

Na primjer:

```swift
user == userID
```

To znači: je li korisničko ime koje je korisnik unio potpuno jednako ispravnom korisničkom imenu koje smo postavili? Provjera lozinke slijedi istu logiku.

Zato, kada su uneseni korisničko ime i lozinka jednaki postavljenim vrijednostima, rezultat će biti `Success`; čim jedno od njih nije jednako, rezultat će biti `Input error`.

Na taj način dovršili smo jednostavnu "simulaciju provjere prijave".

Iako to još nije prava funkcija prijave povezana s poslužiteljem, već je sasvim dovoljno da nam pomogne razumjeti: **nakon dodira gumba može se izvršiti različit kod ovisno o različitim uvjetima**.

## Sažetak

U ovoj lekciji dovršili smo osnovni prikaz prijave i posebno se usredotočili na učenje "logike prosuđivanja unesenog sadržaja prema uvjetima".

Glavni sadržaj ove lekcije jest: korištenje `isEmpty` za određivanje je li niz znakova prazan, te korištenje `if` naredbi zajedno s logičkim operatorima za obradu različitih situacija.

Među njima postoje dva vrlo važna logička operatora:

- `&&`: znači "i", oba uvjeta moraju biti ispunjena
- `||`: znači "ili", dovoljno je da jedan uvjet bude ispunjen

Kada ti uvjeti na kraju daju `true` ili `false`, `if` naredba će izvršiti različit kod na temelju rezultata.

Kroz ovaj prikaz prijave već smo počeli dolaziti u doticaj s načinom razvoja koji kombinira "sučelje + podatke + logičko prosuđivanje".

## Potpuni kod

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
