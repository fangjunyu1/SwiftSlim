# Zobrazenie prihlásenia

V tejto lekcii sa naučíme veľmi praktický scenár — zobrazenie prihlásenia.

Či už ide o webovú stránku alebo aplikáciu, počas používania musí používateľ v mnohých prípadoch zadať účet a heslo a prihlásiť sa.

Napríklad prihlasovacia stránka GitHubu:

![WordPress](../../Resource/019_github.png)

V tejto lekcii vytvoríme podobné zobrazenie prihlásenia, aby používateľ mohol ručne zadať účet a heslo a skontrolovať, či so zadaným obsahom nie je nejaký problém.

## Horné rozloženie

Kód zobrazenia prihlásenia budeme písať do súboru `ContentView`.

Najprv vytvoríme identifikačnú oblasť v hornej časti zobrazenia prihlásenia. Najskôr si môžete pripraviť vhodný obrázok ikony a vložiť ho do priečinka `Assets`.

![icon](../../Resource/019_icon1.png)

Potom použite `Image` a modifikátory na zobrazenie obrázka:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Tieto modifikátory znamenajú:

- `resizable()`: umožní meniť veľkosť obrázka.
- `scaledToFit()`: škáluje obrázok pri zachovaní pôvodného pomeru strán.
- `frame(width: 100)`: nastaví zobrazenú šírku obrázka na `100`.

Ďalej použite `Text` a modifikátory na zobrazenie nadpisu prihlásenia:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Potom použite `VStack`, aby ste obrázok a text usporiadali zvisle:

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

Výsledný efekt:

![view](../../Resource/019_view.png)

Týmto sme dokončili oblasť nadpisu v hornej časti zobrazenia prihlásenia.

### Optimalizácia rozloženia

Teraz sa obrázok a nadpis štandardne nachádzajú v strede celého rozloženia.

Ak chceme, aby viac pripomínali „prihlasovacie označenie v hornej časti stránky“, môžeme použiť `Spacer()`, aby sme vyplnili zostávajúci priestor a obsah zobrazili bližšie k hornej časti.

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

Výsledný efekt:

![view](../../Resource/019_view1.png)

Teraz sú však `Image` a `Text` príliš blízko pri hornej časti obrazovky a pôsobia trochu stiesnene.

V takom prípade môžeme použiť `padding`, aby sme pridali horný odstup pre celý `VStack`.

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

Výsledný efekt:

![view](../../Resource/019_view2.png)

Takto oblasť nadpisu v hornej časti stránky vyzerá vhodnejšie.

## Používateľské meno a heslo

Prihlasovacia stránka zvyčajne vyžaduje, aby používateľ zadal používateľské meno a heslo.

V SwiftUI môžeme použiť `TextField` na prijatie obsahu, ktorý používateľ zadá.

Treba si však uvedomiť: `TextField` sám o sebe dlhodobo neukladá zadané údaje, je to iba vstupný ovládací prvok. To, čo tieto údaje skutočne ukladá, sú premenné, ktoré naň naviažeme.

Preto musíme najprv vytvoriť dve premenné `@State`, ktoré budú uchovávať používateľské meno a heslo:

```swift
@State private var user = ""
@State private var password = ""
```

Keď sa hodnota premennej `@State` zmení, SwiftUI automaticky obnoví súvisiace zobrazenie.

Ďalej použite `TextField` na naviazanie týchto dvoch premenných:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Tu `$user` a `$password` znamenajú „prepojenie“.

To znamená, že keď používateľ píše do vstupného poľa, premenná sa mení súčasne; a keď sa zmení premenná, súčasne sa zmení aj obsah zobrazený vo vstupnom poli.

Tento vzťah, v ktorom sa „zobrazenie a údaje navzájom synchronizujú“, sa nazýva prepojenie.

Všimnite si, že tu musíme použiť zápis s `$`:

```swift
$user
```

Pretože `TextField` nepotrebuje obyčajný reťazec, ale hodnotu prepojenia, ktorá „môže obojsmerne meniť údaje“.

### Zobrazenie vstupných polí

Umiestnime ich do `ContentView`:

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

Zobrazený efekt:

![view](../../Resource/019_view3.png)

Keďže `user` a `password` sú teraz predvolene prázdne reťazce:

```swift
""
```

Vstupné pole najprv zobrazí zástupný text, napríklad:

```swift
input user
```

Tento text iba naznačuje používateľovi, „čo sem treba zadať“, a nie je skutočným zadaným obsahom.

### Optimalizácia vstupných polí

Teraz sa vstupné polia už dajú používať, ale predvolený štýl je pomerne jednoduchý.

Aby bolo rozhranie prehľadnejšie, môžeme pred vstupné pole pridať nadpis a samotné vstupné pole trochu vizuálne upraviť.

Napríklad najprv pridajme nadpis:

```swift
Text("Username")
    .fontWeight(.bold)
```

Potom použijeme `HStack`, aby sme nadpis a vstupné pole umiestnili do jedného riadku:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Tu používame `HStack`, pretože chceme „zobraziť nadpis vľavo a vstupné pole vpravo“.

Treba si všimnúť, že `TextField` predvolene zaberá zostávajúci dostupný priestor.

![color](../../Resource/019_view6.png)

Aby boli veľkosti oboch vstupných polí jednotnejšie, môžeme použiť `frame(width:)` na nastavenie šírky, vďaka čomu budú vstupné polia pôsobiť usporiadanejšie.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Potom pridajte okraj, aby bolo vstupné pole viditeľnejšie:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Teraz pridáme do zobrazenia `ContentView` používateľské meno aj heslo:

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

Zobrazený efekt:

![view](../../Resource/019_view4.png)

V tomto bode už používateľ môže zadávať používateľské meno a heslo.

## Tlačidlo prihlásenia

Ďalej pridáme pod vstupné polia tlačidlo prihlásenia.

```swift
Button("Sign in") {

}
```

Potom použite `buttonStyle`, aby malo tlačidlo výraznejší systémový štýl:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Zobrazený efekt:

![view](../../Resource/019_view5.png)

Aby sme potvrdili, že tlačidlo naozaj reaguje na kliknutie, môžeme najprv do tlačidla napísať `print` na otestovanie:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Po kliknutí na tlačidlo konzola vypíše:

```swift
click Sign in
```

To znamená, že tlačidlo už úspešne reaguje na kliknutie.

## Logika prihlásenia

Teraz pridáme k tlačidlu prihlásenia najzákladnejšiu validačnú logiku: **zistiť, či používateľ zadal používateľské meno a heslo**.

Chceme dosiahnuť nasledujúce situácie:

- Ak používateľ nezadal nič, vypíšeme `Empty`
- Ak používateľ zadal iba jednu z položiek, upozorníme, ktorá chýba
- Ak sú zadané používateľské meno aj heslo, vypíšeme `Success`

### Nie sú zadané žiadne informácie

Keďže `user` a `password` sú predvolene prázdne reťazce:

```swift
@State private var user = ""
@State private var password = ""
```

Keď používateľ nič nezadá, zostanú prázdne.

V Swift-e môžu typy ako `String` použiť `isEmpty` na zistenie, či je obsah prázdny.

### Vlastnosť isEmpty

`isEmpty` sa často používa na kontrolu, či sú reťazce, polia a iný obsah prázdne.

Napríklad:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Ak je obsah prázdny, `isEmpty` vráti `true`; ak obsah nie je prázdny, `isEmpty` vráti `false`.

Preto ho môžeme použiť na určenie, či boli zadané používateľské meno a heslo.

### Použitie isEmpty na kontrolu premenných

Ak používateľ nezadal žiadne informácie, potom:

```swift
user.isEmpty // true
password.isEmpty    // true
```

V tomto momente môžeme podmienku napísať takto:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Tento kód znamená: ak je `user` prázdne a `password` je tiež prázdne, vypíšeme:

```swift
Empty
```

Tu je `&&` logický operátor a znamená „a“.

To znamená, že celá podmienka platí len vtedy, keď platí podmienka naľavo a zároveň aj podmienka napravo.

Preto sa tento kód vykoná iba vtedy, keď sú používateľské meno aj heslo prázdne.

## Používateľ vyplnil iba časť

Ďalej sa pozrime na inú situáciu: používateľ vyplnil iba používateľské meno alebo iba heslo.

Napríklad:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Vtedy používateľské meno nie je prázdne, ale heslo je prázdne.

Na kontrolu môžeme ďalej používať `isEmpty`:

### Situácia, keď používateľ vyplnil účet alebo heslo

Ak používateľ vyplnil iba používateľské meno alebo heslo, musíme zobraziť príslušné upozornenie na chýbajúcu položku.

Napríklad, ak používateľ vyplnil iba používateľské meno:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logika tohto kódu je takáto: ak je používateľské meno prázdne, vyzveme na jeho zadanie. Inak skontrolujeme, či je heslo prázdne; ak áno, vyzveme na zadanie hesla.

### Používateľ vyplnil všetky informácie

Ak sú používateľské meno aj heslo zadané, potom `isEmpty` pri oboch vráti `false`.

V takom prípade to môžeme napísať takto:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Tu `!` znamená „negáciu“.

Napríklad:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

To znamená, že `user.isEmpty` sa používa na zistenie, „či je používateľské meno prázdne“, a `!user.isEmpty` sa používa na zistenie, „či používateľské meno nie je prázdne“.

Pre heslo platí rovnaká logika.

Význam tohto kódu teda je: používateľské meno nie je prázdne a heslo tiež nie je prázdne.

Keď sú obe tieto podmienky splnené, vypíše sa:

```swift
Success
```

## Úplná validačná logika

Teraz spojíme tieto tri situácie a zapíšeme ich do `Button`:

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

Poradie vykonávania tohto kódu možno pochopiť takto:

V prvom kroku najprv skontrolujeme:

```swift
if user.isEmpty && password.isEmpty
```

Ak sú používateľské meno aj heslo prázdne, priamo sa vypíše `Empty`.

Ak obidve nie sú prázdne, pokračujeme kontrolou nasledujúceho riadku:

```swift
else if user.isEmpty || password.isEmpty
```

Tu `||` znamená „alebo“.

To znamená, že stačí, aby bola splnená jedna z podmienok, a celý výraz je splnený.

Preto sa blok kódu `else if` vykoná vždy, keď je používateľské meno prázdne alebo heslo prázdne.

Po vstupe do bloku kódu ďalej skontrolujeme, ktoré vstupné pole presne nebolo vyplnené:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Ak prvé dve podmienky nie sú splnené, znamená to, že používateľské meno nie je prázdne a heslo tiež nie je prázdne.

Program potom vstúpi do posledného `else`:

```swift
print("Success")
```

Takto sme dokončili najzákladnejšiu logiku validácie vstupu pri prihlásení.

## Kontrola používateľského mena a hesla

Vyššie uvedená logika kontroluje iba to, „či bol zadaný nejaký obsah“.

V skutočnej aplikácii však samotné zadanie obsahu nestačí. Zvyčajne je potrebné odoslať používateľské meno a heslo na server na overenie.

Ak server potvrdí, že používateľské meno existuje a heslo je správne, prihlásenie bude povolené; inak sa zobrazí chyba prihlásenia.

Aby sme si tento proces precvičili, môžeme si najprv v kóde nastaviť dočasný účet a heslo, čím nasimulujeme „správne prihlasovacie údaje“:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Keď používateľské meno aj heslo nie sú prázdne, ďalej ich porovnáme a zistíme, či sú správne:

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

Tu `==` znamená „či sú rovnaké“.

Napríklad:

```swift
user == userID
```

To znamená, či používateľské meno zadané používateľom úplne zodpovedá správnemu používateľskému menu, ktoré sme nastavili; pri hesle platí rovnaká logika.

Preto ak sa zadané používateľské meno a heslo zhodujú s nastavenými hodnotami, vypíše sa `Success`; ak sa čo i len jedna hodnota nezhoduje, vypíše sa `Input error`.

Takto sme dokončili jednoduché „simulované overenie prihlásenia“.

Hoci to ešte nie je skutočná prihlasovacia funkcia pripojená k serveru, už to stačí na to, aby nám to pomohlo pochopiť: **po kliknutí na tlačidlo sa môže vykonať rôzny kód podľa rôznych podmienok**.

## Zhrnutie

V tejto lekcii sme dokončili základné zobrazenie prihlásenia a zamerali sme sa najmä na učenie sa „logiky posudzovania vstupného obsahu podľa podmienok“.

Hlavným obsahom tejto lekcie je používanie `isEmpty` na zistenie, či je reťazec prázdny, a používanie príkazov `if` spolu s logickými operátormi na spracovanie rôznych situácií.

Dva veľmi dôležité logické operátory sú:

- `&&`: znamená „a“, musia byť splnené obe podmienky
- `||`: znamená „alebo“, stačí, ak je splnená jedna podmienka

Keď tieto podmienky nakoniec dajú výsledok `true` alebo `false`, príkaz `if` vykoná rôzny kód podľa výsledku.

Vďaka tomuto zobrazeniu prihlásenia sme sa už začali stretávať so spôsobom vývoja, ktorý spája „rozhranie + údaje + logické posudzovanie“.

## Úplný kód

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
