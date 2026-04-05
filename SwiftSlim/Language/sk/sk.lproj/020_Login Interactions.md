# Interakcie prihlásenia

V predchádzajúcej lekcii sme vytvorili zobrazenie prihlásenia a pomocou tlačidiel a podmienenej logiky sme implementovali jednoduché overenie zadaného obsahu.

V tejto lekcii budeme pokračovať na základe kódu z predchádzajúcej lekcie a naučíme sa o poli na zadanie hesla `SecureField`, výstražnom okne `Alert` a o tom, ako riadiť zobrazovanie rôznych zobrazení podľa premenných.

Vďaka tejto lekcii môžete lepšie pochopiť základný tok interakcie v zobrazení prihlásenia. Je to tiež základná logika, ktorá sa často používa v mnohých aplikáciách.

## Pole na zadanie hesla

V predchádzajúcej lekcii sme na zadanie hesla používali `TextField`.

V skutočnom prihlasovacom rozhraní sa však heslo zvyčajne nezobrazuje priamo. Namiesto toho sa zobrazuje ako bodky alebo s iným skrytým efektom, čo pomáha chrániť súkromie používateľa.

V SwiftUI je ovládací prvok špeciálne určený na zadávanie hesiel `SecureField`.

Napríklad:

```swift
SecureField("Password", text: $password)
```

Jeho zápis je veľmi podobný `TextField`. Takisto potrebuje text zástupného symbolu a naviazanú premennú.

Môžete to jednoducho chápať takto: `SecureField` je tiež vstupné pole, len skrýva zadávaný obsah.

Môžeme priamo zmeniť `TextField`, ktorý sa pôvodne používal na zadávanie hesla, na `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Keď používateľ zadá heslo, obsah hesla sa už nebude v rozhraní zobrazovať priamo.

Efekt zobrazenia:

![password](../../Resource/020_password.png)

Teraz môžeme zadať používateľské meno a heslo a potom kliknúť na tlačidlo, aby sme zistili, či je vstup správny.

### Zobrazenie spätnej väzby

Predtým sme neustále používali `print` na vypisovanie výsledkov.

Obsah z `print` sa zobrazuje iba v konzole. Vývojári ho môžu vidieť pri spustení programu v Xcode, ale bežní používatelia na telefóne tieto správy nevidia.

To znamená, že hoci program už dokončil overenie, používateľ stále nevie, či je zadaný obsah správny.

V tomto bode potrebujeme spôsob, ako zobrazovať správy priamo v rozhraní.

## Výstražné okno Alert

V SwiftUI môžeme na zobrazenie okna so správou použiť `Alert`.

Základné použitie:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Tento kód vyzerá trochu zložitejšie ako predchádzajúce ovládacie prvky, ale môžeme mu porozumieť, keď si ho rozdelíme na časti.

`Alert` obsahuje najmä tieto časti:

- `"Title"`: nadpis výstražného okna
- `isPresented`: naviazaná booleovská hodnota používaná na riadenie toho, či sa výstražné okno zobrazí
- `Button(...)`: tlačidlo vo výstražnom okne
- `message:`: obsah správy zobrazený vo výstražnom okne

Môžete to jednoducho chápať takto: keď sa naviazaná premenná zmení na `true`, systém zobrazí toto výstražné okno.

Efekt zobrazenia:

![alert](../../Resource/020_alert3.png)

Zodpovedajúca štruktúra:

![alert](../../Resource/020_alert.png)

### Alert je modifikátor

Podobne ako mnohé modifikátory, ktoré sme sa učili predtým, aj `Alert` sa pridáva za určité zobrazenie.

Napríklad môže byť pripojený za tlačidlo:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Môže byť tiež pripojený za vonkajší `VStack`:

```swift
VStack {
    // ...
}
.alert() {...}
```

To znamená, že `Alert` nie je samostatné zobrazenie umiestnené v rozhraní nezávisle. Namiesto toho je to modifikátor pripojený k určitému zobrazeniu.

Môžete to jednoducho chápať takto: `Alert` sa zvyčajne píše za tlačidlo alebo za vonkajšie rozloženie, aby sa zobrazila správa pri splnení určitej podmienky.

### Zobrazenie Alert

Ak chceme zobraziť `Alert`, potrebujeme premennú, ktorá ho bude riadiť.

Napríklad:

```swift
@State private var showAlert = false
```

Táto premenná je typu `Bool`, čo znamená, že má len dve hodnoty: `true` alebo `false`.

Potom ju naviažte na `isPresented` v `Alert`:

```swift
isPresented: $showAlert
```

Keď je `showAlert` `false`, výstražné okno sa nezobrazí. Keď je `showAlert` `true`, výstražné okno sa zobrazí.

### Zobrazenie výstražného okna pomocou tlačidla

Teraz najprv implementujme najjednoduchší scenár:

Keď používateľ nezadá vôbec nič a priamo klikne na tlačidlo `Sign in`, zobrazí sa okno so správou, ktoré mu povie: „Ešte ste nezadali žiadny obsah.“

Najprv vytvorte premennú na riadenie tohto okna so správou:

```swift
@State private var showEmpty = false
```

Potom pridajte `Alert` za `Button`:

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

Ďalej vykonajte kontrolu v kóde po kliknutí na tlačidlo:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Ak sú `user` aj `password` prázdne, nastavte `showEmpty` na `true`.

A pretože `Alert` je na túto premennú naviazaný, keď sa zmení na `true`, systém automaticky zobrazí výstražné okno.

Efekt zobrazenia:

![alert](../../Resource/020_alert1.png)

Takto môže používateľ po kliknutí na tlačidlo okamžite vidieť správu a vývojár nemusí kontrolovať výstup `print` v konzole.

### Vylepšenie tlačidla a výstražných okien

Predtým sme riešili iba prípad, keď „nebolo vyplnené nič“.

Stále musíme riešiť tieto situácie:

- chýba používateľské meno
- chýba heslo
- používateľské meno aj heslo sú vyplnené, ale vstup je nesprávny

Preto musíme pripraviť aj zodpovedajúce správy pre tieto prípady.

Najprv pridajte tri nové premenné:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Potom pokračujte v pridávaní zodpovedajúcich `Alert` za tlačidlo:

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

Potom doplňte rozhodovaciu logiku vo vnútri tlačidla:

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

Keď tlačidlo zistí, že používateľ nevyplnil žiadne informácie, vynechal jednu informáciu alebo neprešiel overením vstupu, zmení príslušnú booleovskú premennú na `true` a potom sa zobrazí zodpovedajúci `Alert`.

Tu vám odporúčam, aby ste si sami otestovali niekoľko situácií:

- nevyplňte nič
- vyplňte iba používateľské meno
- vyplňte iba heslo
- vyplňte používateľské meno aj heslo, ale s nesprávnym obsahom
- vyplňte používateľské meno aj heslo a obsah je správny

To pomáha overiť, či má náš kód nejaké problémy. Je to tiež veľmi dôležitý krok „testovania“ pri vývoji aplikácií.

Ak sa program v určitom scenári správa nesprávne, znamená to, že v logike môže byť problém a v programe sa objavil `Bug`.

To, čo vývojári bežne nazývajú `Bug`, znamená chybu, nedostatok alebo správanie, ktoré nezodpovedá očakávaniam.

## Dokončenie zobrazenia prihlásenia

Príklady `Alert`, o ktorých sme hovorili skôr, boli všetky o tom, ako poskytnúť používateľovi spätnú väzbu, keď je „vstup nesprávny“.

Keď používateľ zadá správne používateľské meno a heslo, zvyčajne nezobrazujeme „výstražné okno“. Namiesto toho priamo vstúpime do rozhrania po prihlásení.

To zahŕňa veľmi dôležitý koncept: **zobrazovanie rôznych zobrazení podľa hodnoty premennej.**

Napríklad:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Tu používame typ `Bool` na riadenie toho, ktoré zobrazenie sa zobrazí:

- ak je `login` `true`, znamená to, že prihlásenie už bolo úspešné a zobrazí sa obsah po prihlásení
- ak je `login` `false`, znamená to, že prihlásenie nebolo úspešné a prihlasovacie rozhranie sa bude zobrazovať ďalej.

Hoci je príkaz `if` v Swifte podmienený príkaz, v `body` SwiftUI sa môže použiť na riadenie logiky zobrazenia.

To znamená, že SwiftUI určí, ktoré zobrazenie sa má aktuálne zobrazovať, na základe výsledku podmienky.

Túto logiku zobrazenia môžeme vložiť do aktuálneho `ContentView`:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Pôvodný kód zobrazenia prihlásenia
		}
	}
}
```

Tu sme pridali novú premennú `login`, ktorá označuje, či sa používateľ už úspešne prihlásil.

Potom sme umiestnili kód prihlasovacieho zobrazenia, ktorý sme už napísali, za vetvu `else`.

Logika zobrazenia:

- keď je `login` `false`, znamená to, že prihlásenie ešte nebolo úspešné, takže sa bude naďalej zobrazovať pôvodné prihlasovacie zobrazenie.
- keď je `login` `true`, znamená to, že prihlásenie je úspešné. V tom okamihu sa prihlasovacie zobrazenie už nezobrazuje a namiesto neho sa zobrazí `Login successful`.

To znamená, že `ContentView` bude zobrazovať odlišný obsah podľa hodnoty `login`.

Ďalej upravme logiku úspešného prihlásenia vo vnútri tlačidla:

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

Keď sú používateľské meno a heslo zadané používateľom obidve správne, nastavíme `login` na `true`.

Hneď ako sa hodnota `login` zmení, zmení sa aj výsledok kontroly `if` v `ContentView` a rozhranie sa prepne z pôvodného prihlasovacieho zobrazenia na `Login successful`.

Efekt zobrazenia je nasledujúci:

![view](../../Resource/020_view.png)

Teraz sme skutočne použili myšlienku „zobrazovania rôznych zobrazení podľa podmienok“ na tejto aktuálnej prihlasovacej stránke.

V skutočných aplikáciách to zvyčajne funguje presne takto: rôzne zobrazenia sa zobrazujú podľa určitej hodnoty.

Napríklad, keď používateľ nie je prihlásený, zobrazí sa prihlasovacia stránka. Po úspešnom prihlásení používateľa sa zobrazí iné rozhranie.

Základná myšlienka je: **použiť zmeny premenných na riadenie toho, aký obsah rozhranie zobrazuje.**

## Zhrnutie

V tejto lekcii sme sa naučili tri dôležité veci:

1. Používať `SecureField` na zadávanie hesiel tak, aby sa obsah hesla nezobrazoval priamo v rozhraní.
2. Používať `Alert` na zobrazovanie správ používateľovi namiesto toho, aby sa vypisovali iba v konzole.
3. Používať premenné a podmienky `if` na riadenie zobrazovania rôznych zobrazení, čo umožňuje prepínanie medzi rozhraním pred prihlásením a po prihlásení.

Naučením sa týchto konceptov teraz dokážeme dokončiť prihlasovacie zobrazenie so základnými interakčnými efektmi a lepšie porozumieť vývojovej myšlienke SwiftUI: „keď sa stav zmení, rozhranie sa aktualizuje“.

## Kompletný kód

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

## Rozšírené vedomosti - Alert s viacerými tlačidlami

V predchádzajúcej časti tejto lekcie sme použili najzákladnejší `Alert`, ktorý má iba jedno tlačidlo a slúži hlavne na upozornenie používateľa.

V skutočnosti môže `Alert` obsahovať aj viacero tlačidiel, aby si používateľ mohol vybrať medzi rôznymi možnosťami.

Napríklad:

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

Po kliknutí na tlačidlo sa zobrazí výzva s tromi možnosťami: `Ok`, `delete` a `cancel`.

Efekt zobrazenia:

![alert](../../Resource/020_alert2.png)

Kliknutie na rôzne tlačidlá vykoná príslušný kód.

### Vlastnosť `role` tlačidla Button

Tu si všimnete, že `Button` vo vnútri `Alert` je trochu odlišný od bežného zápisu tlačidla, ktorý sme sa učili skôr:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Tu je navyše parameter `role`.

V SwiftUI sa `role` používa na to, aby systému povedal, aký typ akcie toto tlačidlo predstavuje.

Niektoré bežné roly sú:

- `.cancel`: akcia zrušenia
- `.destructive`: nebezpečná akcia, napríklad odstránenie
- `nil`: bežná akcia

Rôzne hodnoty `role` zvyčajne vedú aj k odlišným vizuálnym štýlom v rozhraní.

Napríklad nebezpečné akcie sa často zobrazujú výraznejším štýlom, aby používateľom pripomenuli, že majú kliknúť opatrne.

Okrem toho `role` poskytuje tlačidlu aj dodatočné sémantické informácie, čo uľahčuje čítačkám obrazovky, ako je VoiceOver na zariadeniach Apple, vysvetliť používateľovi účel tlačidla.

Preto je v vhodných situáciách pridanie `role` k tlačidlu veľmi dobrým zvykom.
