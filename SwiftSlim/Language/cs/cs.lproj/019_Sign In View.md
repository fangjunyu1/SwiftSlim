# Zobrazení přihlášení

V této lekci se naučíme jeden velmi praktický scénář: zobrazení přihlášení.

Ať už jde o web nebo aplikaci, při používání je často potřeba, aby se uživatel přihlásil ke svému účtu a zadal heslo.

Například přihlašovací stránka GitHubu:

![WordPress](../../Resource/019_github.png)

V této lekci vytvoříme podobné zobrazení přihlášení, aby uživatel ručně zadal účet a heslo, a zkontrolujeme, zda je se zadaným obsahem nějaký problém.

## Horní rozložení

Kód zobrazení přihlášení napíšeme do souboru `ContentView`.

Nejprve vytvoříme oblast značky v horní části zobrazení přihlášení. Můžeš si předem připravit vhodný obrázek ikony a vložit ho do složky `Assets`.

![icon](../../Resource/019_icon1.png)

Potom použij `Image` a modifikátory pro zobrazení obrázku:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Těchto několik modifikátorů znamená:

- `resizable()`: umožní změnit velikost obrázku.
- `scaledToFit()`: zachová původní poměr stran obrázku při škálování.
- `frame(width: 100)`: nastaví šířku zobrazeného obrázku na `100`.

Potom použij `Text` a modifikátory pro zobrazení titulku přihlášení:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Poté použij `VStack`, aby se obrázek a text seřadily svisle:

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

Výsledek:

![view](../../Resource/019_view.png)

Tím jsme dokončili oblast titulku v horní části zobrazení přihlášení.

### Optimalizace rozložení

Nyní jsou obrázek a titulek ve výchozím nastavení uprostřed celého rozložení.

Pokud chceme, aby vypadaly více jako "přihlašovací značka v horní části stránky", můžeme použít `Spacer()`, který roztáhne zbývající prostor a posune obsah blíže nahoru.

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

Výsledek:

![view](../../Resource/019_view1.png)

Teď jsou ale `Image` a `Text` příliš blízko horního okraje obrazovky a působí trochu natěsno.

V takové chvíli můžeme použít `padding`, abychom přidali horní odsazení celému `VStack`.

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

Výsledek:

![view](../../Resource/019_view2.png)

Takto vypadá horní oblast titulku stránky o něco vhodněji.

## Uživatelské jméno a heslo

Přihlašovací stránka obvykle vyžaduje, aby uživatel zadal uživatelské jméno a heslo.

Ve SwiftUI můžeme použít `TextField` pro přijetí obsahu, který uživatel zadává.

Je ale potřeba si uvědomit, že `TextField` sám o sobě dlouhodobě neukládá zadaná data, je to pouze vstupní ovládací prvek. To, co tento vstup skutečně ukládá, jsou proměnné, které k němu připojíme.

Proto nejprve musíme vytvořit dvě proměnné `@State`, které budou ukládat uživatelské jméno a heslo:

```swift
@State private var user = ""
@State private var password = ""
```

Když se hodnota proměnné `@State` změní, SwiftUI automaticky obnoví související zobrazení.

Potom použij `TextField` pro navázání těchto dvou proměnných:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Zde `$user` a `$password` představují "binding".

To znamená, že když uživatel píše text do vstupního pole, proměnná se současně mění; a když se proměnná změní, synchronně se změní i obsah zobrazený ve vstupním poli.

Tento vztah, kdy se "view a data vzájemně synchronizují", se nazývá binding.

Všimni si, že tady je potřeba použít zápis s `$`:

```swift
$user
```

Protože `TextField` nepotřebuje obyčejný řetězec, ale binding hodnotu, která "umožňuje obousměrně měnit data".

### Zobrazení vstupních polí

Vložme je do `ContentView`:

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

Efekt zobrazení:

![view](../../Resource/019_view3.png)

Protože `user` a `password` jsou nyní ve výchozím nastavení oba prázdné řetězce:

```swift
""
```

ve vstupním poli se nejprve zobrazí zástupný text, například:

```swift
input user
```

Tento text pouze uživateli napovídá, "co se sem má zadat", a není to skutečný zadaný obsah.

### Optimalizace vstupních polí

Teď už lze vstupní pole používat, ale výchozí styl je poměrně jednoduchý.

Aby bylo rozhraní přehlednější, můžeme před vstupní pole přidat titulek a samotné pole trochu stylově upravit.

Například nejprve přidej titulek:

```swift
Text("Username")
    .fontWeight(.bold)
```

Potom použij `HStack`, aby se titulek a vstupní pole umístily na stejný řádek:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

`HStack` zde používáme proto, že chceme "zobrazit vlevo titulek a vpravo vstupní pole".

Je potřeba si uvědomit, že `TextField` ve výchozím nastavení zabere zbývající dostupný prostor.

![color](../../Resource/019_view6.png)

Aby byla velikost obou vstupních polí jednotnější, můžeme použít `frame(width:)` a nastavit jim šířku, takže budou působit úhledněji.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Pak přidej ještě rámeček, aby bylo vstupní pole o něco výraznější:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Teď přidejme do view `ContentView` jak uživatelské jméno, tak heslo:

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

Efekt zobrazení:

![view](../../Resource/019_view4.png)

Do této chvíle už může uživatel zadávat uživatelské jméno a heslo.

## Tlačítko přihlášení

Níže přidáme pod vstupní pole tlačítko přihlášení.

```swift
Button("Sign in") {

}
```

Potom použij `buttonStyle`, aby tlačítko dostalo výraznější systémový styl:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Efekt zobrazení:

![view](../../Resource/019_view5.png)

Abychom potvrdili, že tlačítko opravdu reaguje na klepnutí, můžeme nejprve do tlačítka napsat `print` pro test:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Po klepnutí na tlačítko konzole vypíše:

```swift
click Sign in
```

To ukazuje, že tlačítko už na klepnutí úspěšně reaguje.

## Logika přihlášení

Teď k tlačítku přihlášení přidáme nejzákladnější validační logiku: **zkontrolovat, zda uživatel zadal uživatelské jméno a heslo**.

Chceme dosáhnout následujících situací:

- Pokud uživatel nezadá nic, vypiš `Empty`
- Pokud uživatel zadá jen jednu z položek, upozorni, která chybí
- Pokud zadá jak uživatelské jméno, tak heslo, vypiš `Success`

### Nebyly zadány žádné informace

Protože `user` a `password` jsou oba ve výchozím nastavení prázdné řetězce:

```swift
@State private var user = ""
@State private var password = ""
```

tak když uživatel nic nezadá, zůstanou stále prázdné.

Ve Swiftu lze u typů jako `String` použít `isEmpty` ke zjištění, zda je obsah prázdný.

### Vlastnost isEmpty

`isEmpty` se často používá ke kontrole, zda jsou řetězce, pole a další obsah prázdné.

Například:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Pokud je obsah prázdný, `isEmpty` vrátí `true`; pokud prázdný není, vrátí `false`.

Proto ho můžeme využít ke zjištění, zda uživatelské jméno a heslo obsahují nějaký vstup.

### Použití isEmpty pro zjištění stavu proměnných

Pokud uživatel nezadal žádné informace, pak:

```swift
user.isEmpty // true
password.isEmpty    // true
```

V takové chvíli můžeme podmínku napsat takto:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Tento kód znamená: pokud je `user` prázdný a `password` je také prázdný, vypiš:

```swift
Empty
```

`&&` je zde logický operátor a znamená "a zároveň".

Jinými slovy, celá podmínka je splněná jen tehdy, když je splněná podmínka vlevo i podmínka vpravo.

Proto se tento kód spustí jen tehdy, když jsou prázdné jak uživatelské jméno, tak heslo.

## Uživatel vyplnil jen část

Dále se podívejme na jinou situaci: uživatel vyplnil jen uživatelské jméno, nebo jen heslo.

Například:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

V této chvíli není uživatelské jméno prázdné, ale heslo prázdné je.

Ke kontrole můžeme dál používat `isEmpty`:

### Situace, kdy uživatel vyplnil účet nebo heslo

Pokud uživatel vyplní jen uživatelské jméno nebo heslo, musíme dát odpovídající upozornění na chybějící položku.

Například když uživatel vyplní jen uživatelské jméno:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Logika tohoto kódu je: pokud je uživatelské jméno prázdné, vyzvi k zadání uživatelského jména. Jinak zkontroluj, zda je heslo prázdné, a pokud ano, vyzvi k zadání hesla.

### Uživatel vyplnil všechny informace

Pokud už jsou zadány jak uživatelské jméno, tak heslo, `isEmpty` v obou případech vrátí `false`.

Potom to můžeme napsat takto:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

`!` zde znamená "negaci".

Například:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

To znamená, že `user.isEmpty` se používá ke zjištění, "zda je uživatelské jméno prázdné", a `!user.isEmpty` ke zjištění, "zda uživatelské jméno prázdné není".

U hesla platí úplně stejná logika.

Význam tohoto kódu tedy je: uživatelské jméno není prázdné a heslo také není prázdné.

Když jsou obě podmínky splněny, výstup bude:

```swift
Success
```

## Kompletní validační logika

Teď tyto tři situace spojíme dohromady a zapíšeme je do `Button`:

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

Pořadí vykonání tohoto kódu lze chápat takto:

Prvním krokem je nejprve zkontrolovat:

```swift
if user.isEmpty && password.isEmpty
```

Pokud jsou uživatelské jméno i heslo prázdné, vypíše se rovnou `Empty`.

Pokud nejsou obě prázdné, pokračuje se kontrolou následujícího řádku:

```swift
else if user.isEmpty || password.isEmpty
```

`||` zde znamená "nebo".

Jinými slovy, stačí, aby byla splněna jedna z podmínek, a celek bude splněný.

Proto jakmile je uživatelské jméno prázdné nebo je prázdné heslo, spustí se blok kódu `else if`.

Po vstupu do bloku se dále kontroluje, které vstupní pole přesně nebylo vyplněno:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Pokud neplatí ani jedna z předchozích dvou podmínek, znamená to, že uživatelské jméno prázdné není a heslo také není prázdné.

Program pak vstoupí do posledního `else`:

```swift
print("Success")
```

Tím jsme dokončili nejzákladnější validační logiku přihlašovacího vstupu.

## Ověření uživatelského jména a hesla

Výše uvedená logika jen kontroluje, "zda byl zadán nějaký obsah".

V reálné aplikaci ale nestačí jen něco zadat. Obvykle je také potřeba odeslat uživatelské jméno a heslo na server k ověření.

Pokud server potvrdí, že uživatelské jméno existuje a heslo je správné, dovolí přihlášení; jinak upozorní na neúspěšné přihlášení.

Abychom si tento proces procvičili, můžeme si nejprve v kódu nastavit dočasný účet a heslo a simulovat tak "správné přihlašovací údaje":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Když uživatelské jméno ani heslo nejsou prázdné, dále porovnáme, zda jsou správné:

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

`==` zde znamená "zda se rovná".

Například:

```swift
user == userID
```

To znamená, zda je uživatelské jméno zadané uživatelem úplně stejné jako správné uživatelské jméno, které jsme nastavili; ověření hesla funguje stejnou logikou.

Proto když se zadané uživatelské jméno a heslo rovnají nastaveným hodnotám, vypíše se `Success`; jakmile se jedna z hodnot nerovná, vypíše se `Input error`.

Tím jsme dokončili jednoduchou "simulaci ověření přihlášení".

I když to ještě není skutečná přihlašovací funkce propojená se serverem, už to bohatě stačí k pochopení: **po klepnutí na tlačítko lze podle různých podmínek provádět různý kód**.

## Shrnutí

V této lekci jsme dokončili základní zobrazení přihlášení a zaměřili se hlavně na to, jaká je "logika posuzování zadaného obsahu podle podmínek".

Jádrem této lekce je: použít `isEmpty` ke zjištění, zda je řetězec prázdný, a použít příkaz `if` spolu s logickými operátory pro zpracování různých situací.

Mezi nimi jsou dva velmi důležité logické operátory:

- `&&`: znamená "a", musí být splněny obě podmínky
- `||`: znamená "nebo", stačí splnit jednu podmínku

Když tyto podmínky nakonec dají `true` nebo `false`, příkaz `if` podle výsledku provede jiný kód.

Prostřednictvím tohoto zobrazení přihlášení jsme se už začali seznamovat se stylem vývoje, který kombinuje "rozhraní + data + logické vyhodnocování".

## Kompletní kód

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
