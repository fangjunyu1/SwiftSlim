# Interakce přihlášení

V minulé lekci jsme vytvořili zobrazení přihlášení a pomocí tlačítek a podmínkové logiky jsme provedli jednoduché ověření zadaného obsahu.

V této lekci budeme pokračovat na základě kódu z předchozí lekce a naučíme se používat pole pro zadávání hesla `SecureField`, upozorňovací okno `Alert` a také to, jak podle proměnných řídit zobrazení různých pohledů.

Díky této lekci můžeš lépe porozumět základnímu interakčnímu toku přihlašovací obrazovky, což je také základní logika používaná v mnoha aplikacích.

## Pole pro zadání hesla

V minulé lekci jsme pro zadání hesla použili `TextField`.

Ale ve skutečné přihlašovací obrazovce se heslo obvykle nezobrazuje přímo, ale jako tečky nebo jiný skrytý efekt, aby bylo chráněno soukromí uživatele.

Ve SwiftUI je ovládací prvek určený speciálně pro zadávání hesla `SecureField`.

Například:

```swift
SecureField("Password", text: $password)
```

Jeho zápis je velmi podobný `TextField`, stejně tak vyžaduje text nápovědy a navázanou proměnnou.

Lze to jednoduše chápat takto: `SecureField` je také vstupní pole, jen skryje obsah, který se zadává.

Můžeme přímo nahradit `TextField`, který jsme původně používali pro zadání hesla, prvkem `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Když uživatel zadává heslo, obsah hesla se v rozhraní přímo nezobrazí.

Efekt zobrazení:

![password](../../Resource/020_password.png)

Nyní můžeme zadat uživatelské jméno a heslo a po kliknutí na tlačítko vyhodnotit, zda je vstup správný.

### Zobrazení zpětné vazby

Dříve jsme k výpisu výsledků neustále používali `print`.

Obsah `print` se zobrazuje pouze v konzoli. Vývojář ho vidí při spuštění programu v Xcode, ale běžný uživatel na telefonu tyto zprávy nevidí.

To znamená, že ačkoliv program již vyhodnocení provedl, uživatel neví, zda je zadaný obsah správný.

V takovém případě potřebujeme způsob, jak zobrazit upozornění přímo v rozhraní.

## Upozorňovací okno Alert

Ve SwiftUI můžeme použít `Alert` k zobrazení vyskakovacího okna s upozorněním.

Základní použití:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Tento úsek kódu vypadá o něco složitěji než předchozí ovládací prvky, ale můžeme si ho rozebrat.

`Alert` obsahuje hlavně následující části:

- `"Title"`: název upozorňovacího okna
- `isPresented`: navázaná booleovská hodnota, která řídí, zda se upozorňovací okno zobrazí
- `Button(...)`: tlačítko v upozorňovacím okně
- `message:`: text upozornění zobrazený v okně

Jednoduše řečeno, když se navázaná proměnná změní na `true`, systém toto okno zobrazí.

Efekt zobrazení:

![alert](../../Resource/020_alert3.png)

Odpovídající struktura:

![alert](../../Resource/020_alert.png)

### Alert je modifikátor

Stejně jako mnoho modifikátorů, které jsme se naučili dříve, se `Alert` také přidává za určité zobrazení.

Například jej lze připojit za tlačítko:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

Lze jej také připojit za vnější `VStack`:

```swift
VStack {
    // ...
}
.alert() {...}
```

To znamená, že `Alert` není samostatné zobrazení umístěné v rozhraní, ale modifikátor navázaný na určité zobrazení.

Lze to jednoduše chápat tak, že `Alert` se obvykle píše za tlačítko nebo za vnější rozvržení, aby při splnění určité podmínky zobrazil upozornění.

### Zobrazení Alertu

Pokud chceme `Alert` zobrazit, potřebujeme proměnnou, která jej bude řídit.

Například:

```swift
@State private var showAlert = false
```

Tato proměnná je typu `Bool`, tedy může mít jen dvě hodnoty: `true` nebo `false`.

Potom ji navážeme na `isPresented` u `Alert`:

```swift
isPresented: $showAlert
```

Když je `showAlert` `false`, upozorňovací okno se nezobrazí; když je `showAlert` `true`, okno se zobrazí.

### Zobrazení upozorňovacího okna pomocí tlačítka

Nyní nejprve vytvoříme ten nejjednodušší scénář:

Když uživatel nic nezadá a rovnou klikne na tlačítko `Sign in`, zobrazí se okno s upozorněním, které mu řekne: „Ještě jsi nezadal žádný obsah.“

Nejprve vytvoř proměnnou pro řízení tohoto upozorňovacího okna:

```swift
@State private var showEmpty = false
```

Poté přidej za `Button` jeden `Alert`:

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

Následně proveď kontrolu v kódu po kliknutí na tlačítko:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Pokud jsou `user` i `password` prázdné, nastavíme `showEmpty` na `true`.

A protože je `Alert` na tuto proměnnou navázán, systém při změně na `true` automaticky zobrazí upozornění.

Efekt zobrazení:

![alert](../../Resource/020_alert1.png)

Takto uživatel po kliknutí na tlačítko okamžitě uvidí upozornění a vývojář nebude muset kontrolovat výstup `print` v konzoli.

### Doplnění tlačítka a upozorňovacích oken

Dříve jsme řešili jen situaci „nebylo vyplněno nic“.

Ještě potřebujeme zpracovat následující případy:

- chybí uživatelské jméno
- chybí heslo
- uživatelské jméno i heslo jsou vyplněné, ale vstup je nesprávný

Proto si musíme připravit odpovídající upozornění i pro tyto situace.

Nejprve přidej tři nové proměnné:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Potom za tlačítko dále přidej odpovídající `Alert`:

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

Poté doplň logiku vyhodnocení uvnitř tlačítka:

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

Když tlačítko vyhodnotí, že uživatel nevyplnil žádné údaje, vynechal jednu položku nebo ověření vstupu selhalo, změní se příslušná booleovská proměnná na `true` a poté se zobrazí odpovídající `Alert`.

Tady doporučuji, abys sám otestoval několik situací:

- nevyplnit nic
- vyplnit jen uživatelské jméno
- vyplnit jen heslo
- vyplnit uživatelské jméno i heslo, ale se špatným obsahem
- vyplnit uživatelské jméno i heslo a zadat správný obsah

Tím ověříme, zda v našem kódu není problém, a to je také velmi důležitá fáze „testování“ při vývoji aplikací.

Pokud se v nějakém scénáři program nechová správně, znamená to, že může být problém v logice a že se v programu objevil `Bug`.

To, čemu se ve vývoji běžně říká `Bug`, znamená chybu, závadu nebo chování, které neodpovídá očekávání.

## Dokončení přihlašovacího zobrazení

Dříve zmiňovaný `Alert` sloužil k tomu, jak dát uživateli upozornění při „chybném zadání“.

Když uživatel zadá správné uživatelské jméno a heslo, obvykle nevyskakujeme s „upozorňovacím oknem“, ale přímo přejdeme do rozhraní po přihlášení.

Tady se dostáváme k velmi důležitému bodu: **podle hodnoty proměnné zobrazovat různé pohledy.**

Například:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Zde používáme typ `Bool` ke správě zobrazení:

- pokud je `login` `true`, znamená to, že přihlášení bylo úspěšné a zobrazí se obsah po přihlášení
- pokud je `login` `false`, znamená to, že přihlášení úspěšné nebylo, a dál se zobrazuje přihlašovací rozhraní.

Přestože je příkaz `if` podmíněný příkaz ve Swiftu, ve `body` SwiftUI ho lze použít k řízení logiky zobrazení.

To znamená, že SwiftUI podle výsledku podmínky rozhodne, který pohled se má právě zobrazit.

Tuto logiku zobrazení můžeme vložit do aktuálního `ContentView`:

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

Zde jsme přidali novou proměnnou `login`, která slouží k vyjádření, zda se uživatel již úspěšně přihlásil.

Potom jsme za větev `else` vložili kód přihlašovacího zobrazení, který jsme už předtím napsali.

Logika zobrazení:

- když je `login` `false`, znamená to, že přihlášení ještě nebylo úspěšné, a dál se zobrazuje původní přihlašovací zobrazení.
- když je `login` `true`, znamená to, že přihlášení bylo úspěšné, a v tu chvíli se už nezobrazuje přihlašovací zobrazení, ale `Login successful`.

To znamená, že `ContentView` bude podle hodnoty `login` zobrazovat různý obsah.

Dále upravme logiku úspěšného přihlášení uvnitř tlačítka:

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

Když uživatel zadá správné uživatelské jméno i heslo, změníme `login` na `true`.

Jakmile se hodnota `login` změní, změní se i výsledek vyhodnocení `if` v `ContentView` a rozhraní se přepne z původního přihlašovacího zobrazení na `Login successful`.

Efekt zobrazení je následující:

![view](../../Resource/020_view.png)

Teď už jsme znalost „podle podmínky zobrazovat různé pohledy“ skutečně použili na této přihlašovací stránce.

V reálných aplikacích se také obvykle používá tento způsob rozhodování: podle určité hodnoty zobrazit jiný pohled.

Například když uživatel není přihlášen, zobrazí se přihlašovací stránka; po úspěšném přihlášení se zobrazí jiné rozhraní.

Hlavní myšlenka je: **pomocí změn proměnných řídit, jaký obsah se má v rozhraní zobrazit.**

## Shrnutí

V této lekci jsme se naučili tři důležité věci:

1. Používat `SecureField` pro zadávání hesla tak, aby se obsah hesla přímo nezobrazoval v rozhraní.
2. Používat `Alert` pro zobrazování upozornění uživateli místo pouhého výpisu do konzole.
3. Používat proměnné a podmínku `if` k řízení zobrazení různých pohledů a realizaci přepínání mezi rozhraním před přihlášením a po něm.

Díky osvojení těchto znalostí už dokážeme dokončit přihlašovací zobrazení se základními interakcemi a lépe porozumět myšlence vývoje ve SwiftUI: „změní se stav, rozhraní se aktualizuje“.

## Kompletní kód

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

## Rozšíření - Alert s více tlačítky

V předchozí části této lekce jsme používali ten nejzákladnější `Alert`, který má jen jedno tlačítko a slouží hlavně k upozornění uživatele.

Ve skutečnosti ale může `Alert` obsahovat i více tlačítek, aby si uživatel mohl vybrat z různých možností.

Například:

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

Po kliknutí na tlačítko se zobrazí okno se třemi možnostmi: `Ok`, `delete` a `cancel`.

Efekt zobrazení:

![alert](../../Resource/020_alert2.png)

Po kliknutí na různé tlačítko se provede odpovídající kód.

### Vlastnost role u Button

Tady si můžeš všimnout, že `Button` uvnitř `Alert` se trochu liší od běžného tlačítka, které jsme se naučili dříve:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Je zde navíc parametr `role`.

Ve SwiftUI se `role` používá k tomu, aby systému řekl, o jaký typ akce se u tohoto tlačítka jedná.

Mezi běžné role patří:

- `.cancel`: zrušení akce
- `.destructive`: nebezpečná akce, například smazání
- `nil`: běžná akce

Různé `role` se obvykle projeví i rozdílným stylem v rozhraní.

Například nebezpečné akce se často zobrazují výraznějším stylem, aby uživateli připomněly, že má kliknout opatrně.

Kromě toho `role` poskytuje tlačítku i další sémantické informace, což usnadňuje čtečkám obrazovky (například VoiceOver na zařízeních Apple) vysvětlit uživateli účel tlačítka.

Proto je v vhodných situacích velmi dobrým zvykem přidat tlačítku `role`.
