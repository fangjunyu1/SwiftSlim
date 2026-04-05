# Prisijungimo sąveikos

Praeitoje pamokoje sukūrėme prisijungimo rodinį ir, naudodami mygtukus bei tikrinimo logiką, įgyvendinome paprastą įvesto turinio patikrinimą.

Šioje pamokoje toliau remsimės ankstesnės pamokos kodu ir mokysimės apie `SecureField` slaptažodžio įvesties lauką, `Alert` įspėjimo langą bei tai, kaip pagal kintamuosius valdyti skirtingų rodinių rodymą.

Per šią pamoką galėsi geriau suprasti pagrindinę prisijungimo rodinio sąveikos eigą, o tai taip pat yra bazinė logika, naudojama daugelyje programėlių.

## Slaptažodžio įvesties laukas

Praeitoje pamokoje slaptažodžiui įvesti naudojome `TextField`.

Tačiau tikroje prisijungimo sąsajoje slaptažodis paprastai nerodomas tiesiogiai, o vietoj to pateikiamas taškais ar kitu paslėpimo efektu, kad būtų apsaugotas naudotojo privatumas.

SwiftUI sistemoje specialiai slaptažodžiui įvesti skirtas valdiklis yra `SecureField`.

Pavyzdžiui:

```swift
SecureField("Password", text: $password)
```

Jo rašymo būdas labai panašus į `TextField`, taip pat reikia užuominos teksto ir susieto kintamojo.

Tai galima paprastai suprasti taip: `SecureField` taip pat yra įvesties laukas, tik jis paslepia įvestą turinį.

Galime tiesiogiai pakeisti anksčiau slaptažodžiui įvesti naudotą `TextField` į `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Kai naudotojas įves slaptažodį, jo turinys sąsajoje nebebus rodomas tiesiogiai.

Rodomas efektas:

![password](../../Resource/020_password.png)

Dabar galime įvesti naudotojo vardą ir slaptažodį, o paspaudę mygtuką nuspręsti, ar įvestis yra teisinga.

### Grįžtamojo ryšio pranešimų rodymas

Anksčiau rezultatams išvesti visą laiką naudojome `print`.

`print` turinys rodomas tik konsolėje. Kūrėjai tai gali matyti paleidę programą Xcode aplinkoje, tačiau paprasti naudotojai telefone tokių pranešimų nemato.

Tai reiškia, kad nors programa jau atliko patikrinimą, naudotojas vis tiek nežino, ar įvestas turinys yra teisingas.

Tokiu metu mums reikia būdo, kaip pranešimus rodyti tiesiogiai sąsajoje.

## Alert įspėjimo langas

SwiftUI sistemoje galime naudoti `Alert`, kad parodytume iššokantį pranešimo langą.

Pagrindinis naudojimas:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Ši kodo dalis atrodo šiek tiek sudėtingesnė nei ankstesni valdikliai, tačiau galime ją suprasti išskaidę.

`Alert` daugiausia sudaro šios dalys:

- `"Title"`: įspėjimo lango pavadinimas
- `isPresented`: susieta loginė reikšmė, naudojama valdyti, ar įspėjimo langas rodomas
- `Button(...)`: įspėjimo lango mygtukas
- `message:`: įspėjimo lange rodomo pranešimo turinys

Paprastai tai galima suprasti taip: kai susieto kintamojo reikšmė tampa `true`, sistema parodo šį pranešimo langą.

Rodomas efektas:

![alert](../../Resource/020_alert3.png)

Atitinkama struktūra:

![alert](../../Resource/020_alert.png)

### Alert yra modifikatorius

Kaip ir daug kitų modifikatorių, kuriuos mokėmės anksčiau, `Alert` taip pat pridedamas po tam tikro rodinio.

Pavyzdžiui, jį galima pridėti po mygtuko:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Jį taip pat galima pridėti po išoriniu `VStack`:

```swift
VStack {
    // ...
}
.alert() {...}
```

Tai reiškia, kad `Alert` nėra atskiras rodinys, padėtas savarankiškai sąsajoje, o modifikatorius, susietas su tam tikru rodiniu.

Paprastai tai galima suprasti taip: `Alert` dažniausiai rašomas po mygtuku arba po išoriniu išdėstymu, kad iššoktų pranešimas, kai įvykdoma tam tikra sąlyga.

### Alert rodymas

Jei norime parodyti `Alert`, mums reikia kintamojo jam valdyti.

Pavyzdžiui:

```swift
@State private var showAlert = false
```

Šis kintamasis yra `Bool` tipo, tai reiškia, kad turi tik dvi reikšmes: `true` arba `false`.

Tada susiejame jį su `Alert` `isPresented`:

```swift
isPresented: $showAlert
```

Kai `showAlert` yra `false`, įspėjimo langas nerodomas; kai `showAlert` yra `true`, įspėjimo langas iššoka.

### Įspėjimo lango rodymas per mygtuką

Dabar pirmiausia įgyvendinkime paprasčiausią scenarijų:

Kai naudotojas nieko neįveda ir tiesiogiai paspaudžia mygtuką `Sign in`, pasirodo pranešimo langas, kuris jam sako: „Tu dar neįvedei jokio turinio.“

Pirmiausia sukurkime kintamąjį šiam pranešimo langui valdyti:

```swift
@State private var showEmpty = false
```

Tada pridėkime `Alert` po `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Toliau mygtuko paspaudimo kode atliekame patikrinimą:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Jei ir `user`, ir `password` yra tušti, pakeisime `showEmpty` į `true`.

Kadangi `Alert` yra susietas su šiuo kintamuoju, kai jis tampa `true`, sistema automatiškai parodo įspėjimo langą.

Rodomas efektas:

![alert](../../Resource/020_alert1.png)

Tokiu būdu, naudotojas po mygtuko paspaudimo gali iš karto pamatyti pranešimą, ir kūrėjui nereikia eiti į konsolę tikrinti `print` išvesties.

### Mygtuko ir įspėjimo lango patobulinimas

Anksčiau apdorojome tik situaciją, kai „neužpildyta nieko“.

Taip pat dar turime apdoroti šias situacijas:

- neįvestas naudotojo vardas
- neįvestas slaptažodis
- naudotojo vardas ir slaptažodis įvesti, bet įvestis neteisinga

Todėl turime paruošti atitinkamus pranešimus ir šioms situacijoms.

Pirmiausia pridėkime tris naujus kintamuosius:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Tada toliau pridėkime atitinkamus `Alert` po mygtuko:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Po to užbaikime sprendimo logiką mygtuko viduje:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

Kai mygtukas nustato, kad naudotojas neužpildė jokios informacijos, praleido vieną lauką arba įvesties tikrinimas nepavyko, jis pakeičia atitinkamą loginį kintamąjį į `true`, o tada pasirodo atitinkamas `Alert`.

Čia siūlau tau pačiam išbandyti kelias situacijas:

- nieko nepildyti
- užpildyti tik naudotojo vardą
- užpildyti tik slaptažodį
- užpildyti naudotojo vardą ir slaptažodį, bet su neteisingu turiniu
- užpildyti naudotojo vardą ir slaptažodį, ir turinys teisingas

Taip galime patikrinti, ar mūsų kode yra problemų. Tai taip pat labai svarbus „testavimo“ etapas programėlių kūrime.

Jei tam tikru scenarijumi programa elgiasi neteisingai, tai reiškia, kad logikoje gali būti problema ir programoje atsirado `Bug`.

Tai, ką kūrime dažnai vadiname `Bug`, reiškia klaidą, spragą arba elgseną, kuri neatitinka lūkesčių.

## Prisijungimo rodinio užbaigimas

Anksčiau aptarti `Alert` visi buvo apie tai, kaip parodyti naudotojui pranešimą, kai „įvestis yra neteisinga“.

Kai naudotojas įveda teisingą naudotojo vardą ir slaptažodį, paprastai mes nerodome „įspėjimo lango“, o tiesiogiai pereiname į sąsają po prisijungimo.

Čia yra labai svarbi sąvoka: **rodyti skirtingus rodinius pagal kintamojo reikšmę.**

Pavyzdžiui:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Čia naudojame `Bool` tipą rodinio rodymui valdyti:

- jei `login` yra `true`, tai reiškia, kad prisijungimas jau sėkmingas ir rodomas turinys po prisijungimo
- jei `login` yra `false`, tai reiškia, kad prisijungimas nepavyko, ir prisijungimo sąsaja toliau rodoma.

Nors `if` sakinys yra Swift kalbos sąlyginis sakinys, SwiftUI `body` viduje jis gali būti naudojamas rodinių rodymo logikai valdyti.

Tai reiškia, kad SwiftUI pagal sąlygos rezultatą nuspręs, kuris rodinys šiuo metu turi būti rodomas.

Šią rodymo logiką galime įdėti į dabartinį `ContentView`:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

Čia pridėjome naują kintamąjį `login`, kuris naudojamas nurodyti, ar naudotojas jau sėkmingai prisijungė.

Tada už `else` sakinio įdėjome anksčiau parašytą prisijungimo rodinio kodą.

Rodinio rodymo logika:

- kai `login` yra `false`, tai reiškia, kad prisijungimas dar nepavyko, todėl toliau rodomas originalus prisijungimo rodinys.
- kai `login` yra `true`, tai reiškia, kad prisijungimas sėkmingas; tuo metu prisijungimo rodinys nebėra rodomas, o vietoje jo rodomas `Login successful`.

Tai reiškia, kad `ContentView` rodys skirtingą rodinio turinį priklausomai nuo `login` reikšmės.

Toliau pakeiskime sėkmingo prisijungimo logiką mygtuko viduje:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

Kai naudotojo įvesti naudotojo vardas ir slaptažodis abu yra teisingi, mes pakeičiame `login` į `true`.

Kai tik `login` reikšmė pasikeičia, pasikeičia ir `if` sprendimo rezultatas `ContentView` viduje, o sąsaja persijungia iš originalaus prisijungimo rodinio į `Login successful`.

Rodomas efektas yra toks:

![view](../../Resource/020_view.png)

Dabar mes iš tikrųjų pritaikėme žinias apie „skirtingų rodinių rodymą pagal sąlygą“ šiam dabartiniam prisijungimo puslapiui.

Tikrose programėlėse dažniausiai būtent taip ir veikia: pagal tam tikrą reikšmę rodomi skirtingi rodiniai.

Pavyzdžiui, kai naudotojas nėra prisijungęs, rodomas prisijungimo puslapis; kai naudotojas sėkmingai prisijungia, rodomas kitas ekranas.

Pagrindinė idėja yra tokia: **per kintamųjų pokyčius valdyti, koks turinys rodomas sąsajoje.**

## Santrauka

Šioje pamokoje išmokome tris svarbius dalykus:

1. Naudoti `SecureField` slaptažodžiui įvesti, kad slaptažodžio turinys nebūtų rodomas tiesiogiai sąsajoje.
2. Naudoti `Alert` pranešimams naudotojui rodyti, o ne tik išvesti juos į konsolę.
3. Naudoti kintamuosius ir `if` sąlygas skirtingų rodinių rodymui valdyti bei įgyvendinti perjungimą tarp sąsajos prieš prisijungimą ir po jo.

Išmokę šiuos dalykus, dabar jau galime užbaigti prisijungimo rodinį su baziniais sąveikos efektais ir geriau suprasti SwiftUI kūrimo idėją: „pasikeitus būsenai, atsinaujina sąsaja“.

## Pilnas kodas

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Išplėstinės žinios - Alert su keliais mygtukais

Ankstesnėje šios pamokos dalyje naudojome patį paprasčiausią `Alert`, kuris turėjo tik vieną mygtuką ir daugiausia buvo skirtas naudotojui perspėti.

Iš tikrųjų `Alert` taip pat gali turėti kelis mygtukus, kad naudotojas galėtų atlikti skirtingus pasirinkimus.

Pavyzdžiui:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

Paspaudus mygtuką, pasirodys pranešimo langas su trimis pasirinkimais: `Ok`, `delete` ir `cancel`.

Rodomas efektas:

![alert](../../Resource/020_alert2.png)

Paspaudus skirtingus mygtukus, bus vykdomas atitinkamas kodas.

### Button role savybė

Čia pastebėsi, kad `Alert` viduje esantis `Button` šiek tiek skiriasi nuo įprasto mygtuko sintaksės, kurią mokėmės anksčiau:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Čia yra papildomas parametras `role`.

SwiftUI sistemoje `role` naudojamas tam, kad sistemai būtų pasakyta, kokio tipo veiksmą šis mygtukas atlieka.

Keletas dažnų role reikšmių yra:

- `.cancel`: atšaukimo veiksmas
- `.destructive`: pavojingas veiksmas, pavyzdžiui, ištrynimas
- `nil`: įprastas veiksmas

Skirtingos `role` reikšmės paprastai lemia ir skirtingus vizualinius stilius sąsajoje.

Pavyzdžiui, pavojingi veiksmai dažnai rodomi labiau išsiskiriančiu stiliumi, kad primintų naudotojui spausti atsargiai.

Be to, `role` suteikia mygtukui papildomos semantinės informacijos, todėl ekrano skaitytuvams (pvz., VoiceOver Apple įrenginiuose) lengviau paaiškinti naudotojui mygtuko paskirtį.

Todėl tinkamose situacijose pridėti `role` mygtukui yra labai geras įprotis.
