# Bejelentkezési interakciók

Az előző leckében készítettünk egy bejelentkezési nézetet, és gombokkal, valamint ellenőrzési logikával egyszerű ellenőrzést valósítottunk meg a bevitt tartalomra.

Ebben a leckében az előző lecke kódjára építve megtanuljuk a `SecureField` jelszóbeviteli mezőt, az `Alert` figyelmeztető ablakot, valamint azt is, hogyan lehet változók alapján különböző nézetek megjelenítését vezérelni.

Ennek a leckének a segítségével jobban megértheted a bejelentkezési nézet alapvető interakciós folyamatát, ami számos alkalmazásban is használt alaplogika.

## Jelszóbeviteli mező

Az előző leckében a `TextField` elemet használtuk a jelszó bevitelére.

Egy valódi bejelentkezési felületen azonban a jelszó általában nem jelenik meg közvetlenül, hanem pontokként vagy más elrejtő effektusként látszik, hogy védje a felhasználó magánéletét.

SwiftUI-ban a jelszóbevitelre kifejezetten használt vezérlő a `SecureField`.

Például:

```swift
SecureField("Password", text: $password)
```

Az írásmódja nagyon hasonlít a `TextField`-re, ugyanúgy szükség van egy segítő szövegre és egy kötött változóra.

Egyszerűen úgy is megérthetjük: a `SecureField` is egy beviteli mező, csak elrejti a beírt tartalmat.

Közvetlenül lecserélhetjük a korábban jelszóbevitelre használt `TextField`-et `SecureField`-re:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Amikor a felhasználó beírja a jelszót, a jelszó tartalma nem jelenik meg közvetlenül a felületen.

Megjelenési hatás:

![password](../../Resource/020_password.png)

Most már be tudjuk írni a felhasználónevet és a jelszót, majd a gombra kattintva meg tudjuk állapítani, hogy a bevitel helyes-e.

### Visszajelző üzenetek megjelenítése

Korábban folyamatosan a `print` használatával írtuk ki az eredményeket.

A `print` tartalma csak a konzolban jelenik meg. A fejlesztők láthatják, amikor Xcode-ban futtatják a programot, de az átlagos felhasználók telefonon nem látják ezeket az üzeneteket.

Ez azt jelenti, hogy bár a program már elvégezte az ellenőrzést, a felhasználó mégsem tudja, hogy a bevitt tartalom helyes-e.

Ilyenkor szükségünk van egy módszerre, amellyel közvetlenül a felületen tudunk üzeneteket megjeleníteni.

## Alert figyelmeztető ablak

SwiftUI-ban az `Alert` segítségével jeleníthetünk meg egy felugró üzenetablakot.

Alapvető használat:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

Ez a kódrészlet kicsit bonyolultabbnak tűnik, mint az előző vezérlők, de ha részekre bontjuk, könnyen megérthető.

Az `Alert` főként a következő részekből áll:

- `"Title"`: a figyelmeztető ablak címe
- `isPresented`: egy kötött logikai érték, amely annak vezérlésére szolgál, hogy a figyelmeztető ablak megjelenjen-e
- `Button(...)`: a figyelmeztető ablak gombja
- `message:`: a figyelmeztető ablakban megjelenő üzenet tartalma

Egyszerűen úgy érthetjük, hogy amikor a kötött változó `true` lesz, a rendszer felugrasztja ezt az üzenetablakot.

Megjelenési hatás:

![alert](../../Resource/020_alert3.png)

Megfelelő szerkezet:

![alert](../../Resource/020_alert.png)

### Az Alert egy módosító

Ahogy sok korábban tanult módosító, úgy az `Alert` is egy adott nézet után kerül hozzáadásra.

Például hozzáadható egy gomb után:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

De hozzáadható a külső `VStack` után is:

```swift
VStack {
    // ...
}
.alert() {...}
```

Ez azt jelenti, hogy az `Alert` nem egy önálló nézet, amely külön helyezkedik el a felületen, hanem egy bizonyos nézethez kapcsolódó módosító.

Egyszerűen úgy érthetjük, hogy az `Alert` általában a gomb vagy a külső elrendezés után íródik, hogy egy bizonyos feltétel teljesülésekor felugró üzenetet jelenítsen meg.

### Alert megjelenítése

Ha `Alert`-et szeretnénk megjeleníteni, szükségünk van egy változóra, amely vezérli azt.

Például:

```swift
@State private var showAlert = false
```

Ez a változó `Bool` típusú, vagyis csak két értéke lehet: `true` vagy `false`.

Ezután ezt kötjük hozzá az `Alert` `isPresented` értékéhez:

```swift
isPresented: $showAlert
```

Amikor a `showAlert` értéke `false`, a figyelmeztető ablak nem jelenik meg; amikor `true`, a figyelmeztető ablak felugrik.

### Figyelmeztető ablak megjelenítése gombbal

Most először valósítsuk meg a legegyszerűbb helyzetet:

Amikor a felhasználó semmit sem ír be, és közvetlenül a `Sign in` gombra kattint, felugrik egy üzenetablak, amely azt mondja neki: „Még nem adtál meg semmilyen tartalmat.”

Először hozz létre egy változót ennek az üzenetablaknak a vezérlésére:

```swift
@State private var showEmpty = false
```

Ezután adj hozzá egy `Alert`-et a `Button` után:

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

Ezután a gombkattintás kódjában végezd el az ellenőrzést:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

Ha a `user` és a `password` is üres, akkor a `showEmpty` értékét `true`-ra állítjuk.

Mivel az `Alert` ehhez a változóhoz van kötve, amikor az `true` lesz, a rendszer automatikusan megjeleníti a figyelmeztető ablakot.

Megjelenési hatás:

![alert](../../Resource/020_alert1.png)

Így a felhasználó közvetlenül a gombra kattintás után láthatja az üzenetet, és a fejlesztőnek nem kell a konzolba mennie a `print` kimenet megnézéséhez.

### A gomb és a figyelmeztető ablak tökéletesítése

Korábban csak a „semmi nincs kitöltve” helyzetet kezeltük.

Még a következő helyzeteket is kezelnünk kell:

- a felhasználónév nincs kitöltve
- a jelszó nincs kitöltve
- a felhasználónév és a jelszó is ki van töltve, de a bevitel hibás

Ezért ezekhez az esetekhez is elő kell készítenünk a megfelelő üzeneteket.

Először adj hozzá három új változót:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Ezután folytasd a megfelelő `Alert` hozzáadását a gomb után:

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

Ezután egészítsd ki a gombon belüli döntési logikát:

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

Amikor a gomb megállapítja, hogy a felhasználó semmilyen adatot nem töltött ki, egy adatot kihagyott, vagy a bevitel ellenőrzése sikertelen volt, a megfelelő logikai változót `true`-ra állítja, majd a megfelelő `Alert` megjelenik.

Itt azt javaslom, hogy próbálj ki magad néhány helyzetet:

- ne tölts ki semmit
- csak a felhasználónevet töltsd ki
- csak a jelszót töltsd ki
- töltsd ki a felhasználónevet és a jelszót is, de hibás tartalommal
- töltsd ki a felhasználónevet és a jelszót is, és a tartalom helyes

Ezzel ellenőrizhetjük, hogy van-e probléma a kódunkban. Ez az alkalmazásfejlesztés egyik nagyon fontos „tesztelési” lépése is.

Ha egy bizonyos helyzetben a program nem megfelelően viselkedik, az azt jelenti, hogy probléma lehet a logikában, és megjelent egy `Bug` a programban.

Amit fejlesztés közben gyakran `Bug`-nak nevezünk, az hibát, hiányosságot vagy az elvárttól eltérő viselkedést jelent.

## A bejelentkezési nézet befejezése

Az előbb említett `Alert`-ek mind arról szóltak, hogyan adjunk a felhasználónak visszajelzést „hibás bevitel” esetén.

Amikor a felhasználó helyesen adja meg a felhasználónevet és a jelszót, általában nem jelenítünk meg „figyelmeztető ablakot”, hanem közvetlenül a bejelentkezés utáni felületre lépünk.

Itt egy nagyon fontos fogalomról van szó: **különböző nézetek megjelenítése egy változó értéke alapján.**

Például:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Itt a `Bool` típust használjuk a nézet megjelenítésének kezelésére:

- ha a `login` `true`, az azt jelenti, hogy a bejelentkezés már sikeres, és a bejelentkezés utáni tartalom jelenik meg
- ha a `login` `false`, az azt jelenti, hogy a bejelentkezés nem sikerült, és a bejelentkezési felület továbbra is látható.

Bár az `if` utasítás a Swiftben feltételes utasítás, a SwiftUI `body` részében a nézetek megjelenítési logikájának vezérlésére is használható.

Ez azt jelenti, hogy a SwiftUI a feltétel eredménye alapján dönti el, hogy éppen melyik nézetet kell megjeleníteni.

Ezt a megjelenítési logikát elhelyezhetjük a jelenlegi `ContentView`-ban:

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

Itt hozzáadtunk egy új `login` változót, amely annak jelzésére szolgál, hogy a felhasználó sikeresen bejelentkezett-e.

Ezután a korábban megírt bejelentkezési nézet kódját az `else` utasítás mögé helyeztük.

Nézetmegjelenítési logika:

- amikor a `login` `false`, az azt jelenti, hogy a bejelentkezés még nem sikerült, ezért továbbra is az eredeti bejelentkezési nézet jelenik meg.
- amikor a `login` `true`, az azt jelenti, hogy a bejelentkezés sikeres; ekkor a bejelentkezési nézet már nem jelenik meg, helyette a `Login successful` látható.

Vagyis a `ContentView` a `login` értékétől függően különböző tartalmat fog megjeleníteni.

Ezután módosítsuk a sikeres bejelentkezés logikáját a gombon belül:

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

Amikor a felhasználó által megadott felhasználónév és jelszó is helyes, a `login` értékét `true`-ra állítjuk.

Amint a `login` értéke megváltozik, a `ContentView`-ban lévő `if` ellenőrzés eredménye is megváltozik, és a felület az eredeti bejelentkezési nézetről `Login successful`-re vált.

A megjelenési hatás a következő:

![view](../../Resource/020_view.png)

Most már valóban alkalmaztuk a „különböző nézetek megjelenítése feltételek alapján” tudást erre az aktuális bejelentkezési oldalra.

A valódi alkalmazásokban is általában így működik: egy adott érték alapján különböző nézetek jelennek meg.

Például amikor a felhasználó nincs bejelentkezve, a bejelentkezési oldal jelenik meg; ha sikeresen bejelentkezik, egy másik felület jelenik meg.

Az alapgondolat az: **a változók változásaival szabályozni, hogy milyen tartalom jelenjen meg a felületen.**

## Összegzés

Ebben a leckében három fontos dolgot tanultunk:

1. A `SecureField` használatát jelszóbevitelhez, hogy a jelszó tartalma ne jelenjen meg közvetlenül a felületen.
2. Az `Alert` használatát üzenetek megjelenítésére a felhasználó számára ahelyett, hogy csak a konzolra írnánk ki azokat.
3. Változók és `if` feltételek használatát különböző nézetek megjelenítésének vezérlésére, valamint a bejelentkezés előtti és utáni felületek közötti váltás megvalósítására.

Ennek a tudásnak az elsajátításával már képesek vagyunk egy alapvető interakciós hatásokkal rendelkező bejelentkezési nézetet elkészíteni, és jobban megérthetjük a SwiftUI fejlesztési szemléletét: „ha az állapot változik, a felület frissül”.

## Teljes kód

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

## Kiterjesztett tudás - Alert több gombbal

Ennek a leckének a korábbi részében a legalapvetőbb `Alert`-et használtuk, amely csak egy gombot tartalmaz, és főként a felhasználó figyelmeztetésére szolgál.

Valójában az `Alert` több gombot is tartalmazhat, hogy a felhasználó különböző döntéseket hozhasson.

Például:

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

A gombra kattintás után egy három opciót tartalmazó üzenetablak jelenik meg: `Ok`, `delete` és `cancel`.

Megjelenési hatás:

![alert](../../Resource/020_alert2.png)

A különböző gombokra kattintva a megfelelő kód hajtódik végre.

### A Button role tulajdonsága

Itt észreveheted, hogy az `Alert`-en belüli `Button` kissé eltér attól a szokásos gombszintaxistól, amelyet korábban tanultunk:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Itt van egy extra `role` paraméter.

SwiftUI-ban a `role` arra szolgál, hogy megmondja a rendszernek, milyen típusú művelethez tartozik ez a gomb.

Néhány gyakori szerep:

- `.cancel`: megszakítási művelet
- `.destructive`: veszélyes művelet, például törlés
- `nil`: normál művelet

A különböző `role` értékek általában különböző vizuális stílusokat is eredményeznek a felületen.

Például a veszélyes műveletek gyakran feltűnőbb stílusban jelennek meg, hogy emlékeztessék a felhasználót az óvatos kattintásra.

Ezenkívül a `role` további szemantikai információkat is biztosít a gomb számára, ami segíti a képernyőolvasókat (például az Apple eszközökön lévő VoiceOvert) abban, hogy elmagyarázzák a felhasználónak a gomb célját.

Ezért a `role` hozzáadása egy gombhoz megfelelő helyzetekben nagyon jó szokás.
