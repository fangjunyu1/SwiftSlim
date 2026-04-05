# Bejelentkezési nézet

Ebben a leckében egy nagyon hasznos helyzetet fogunk megtanulni: a bejelentkezési nézetet.

Akár weboldalról, akár alkalmazásról van szó, használat közben sokszor szükség van arra, hogy a felhasználó bejelentkezzen a fiókjába, és megadja a jelszót.

Például a GitHub bejelentkezési oldala:

![WordPress](../../Resource/019_github.png)

Ebben a leckében egy hasonló bejelentkezési nézetet készítünk, hogy a felhasználó kézzel adja meg a fiókot és a jelszót, mi pedig ellenőrizzük, van-e valamilyen probléma a bevitt tartalommal.

## Felső elrendezés

A bejelentkezési nézet kódját a `ContentView` fájlban fogjuk megírni.

Először írjuk meg a bejelentkezési nézet felső részén lévő azonosítóterületet. Előre elkészíthetsz egy megfelelő ikonképet, és elhelyezheted az `Assets` mappában.

![icon](../../Resource/019_icon1.png)

Ezután használd az `Image` nézetet és a módosítókat a kép megjelenítéséhez:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

Ezek a módosítók a következőt jelentik:

- `resizable()`: lehetővé teszi a kép méretének módosítását.
- `scaledToFit()`: úgy méretezi át a képet, hogy megőrzi az eredeti arányait.
- `frame(width: 100)`: a kép megjelenített szélességét `100`-ra állítja.

Ezután használd a `Text` nézetet és a módosítókat a bejelentkezési cím megjelenítéséhez:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Ezután a `VStack` segítségével rendezd a képet és a szöveget függőlegesen:

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

Eredmény:

![view](../../Resource/019_view.png)

Eddig elkészült a bejelentkezési nézet felső címsávja.

### Az elrendezés optimalizálása

Most a kép és a cím alapértelmezés szerint a teljes elrendezés középső részén található.

Ha azt szeretnénk, hogy inkább „az oldal tetején lévő bejelentkezési jelzésnek” tűnjenek, használhatjuk a `Spacer()` elemet a megmaradt tér kitöltésére, így a tartalom közelebb kerül a felső részhez.

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

Eredmény:

![view](../../Resource/019_view1.png)

Most azonban az `Image` és a `Text` túl közel került a képernyő tetejéhez, és kissé zsúfoltnak tűnik.

Ebben az esetben használhatjuk a `padding` módosítót, hogy felső térközt adjunk az egész `VStack`-nak.

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

Eredmény:

![view](../../Resource/019_view2.png)

Így az oldal felső címsávja megfelelőbbnek tűnik.

## Felhasználónév és jelszó

A bejelentkezési oldal általában megköveteli, hogy a felhasználó megadja a felhasználónevét és a jelszavát.

SwiftUI-ban a `TextField` használható a felhasználó által bevitt tartalom fogadására.

Fontos azonban megjegyezni: a `TextField` önmagában nem tárolja hosszú távon a bevitt adatokat, csak egy beviteli vezérlő. Ami ténylegesen tárolja ezt a bevitt tartalmat, azok a változók, amelyeket hozzá kötünk.

Ezért először létre kell hoznunk két `@State` változót a felhasználónév és a jelszó tárolására:

```swift
@State private var user = ""
@State private var password = ""
```

Amikor egy `@State` változó értéke megváltozik, a SwiftUI automatikusan frissíti a kapcsolódó nézeteket.

Ezután használd a `TextField`-et a két változó kötésére:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Itt a `$user` és a `$password` „binding”-et jelent.

Vagyis amikor a felhasználó szöveget ír a beviteli mezőbe, a változó értéke is ezzel egy időben változik; és amikor a változó megváltozik, a beviteli mezőben megjelenő tartalom is szinkronban változik.

Ezt a kapcsolatot, amikor „a nézet és az adatok egymással szinkronban maradnak”, bindingnek nevezzük.

Figyelj rá, hogy itt a `$`-jeles formát kell használni:

```swift
$user
```

Mert a `TextField`-nek nem egyszerű stringre van szüksége, hanem olyan binding értékre, amely „két irányban képes módosítani az adatokat”.

### A beviteli mezők megjelenítése

Tegyük őket a `ContentView`-ba:

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

Megjelenési eredmény:

![view](../../Resource/019_view3.png)

Mivel a `user` és a `password` jelenleg alapértelmezetten mindkettő üres string:

```swift
""
```

ezért a beviteli mező először helyőrző szöveget fog mutatni, például:

```swift
input user
```

Ez a szöveg csak azt jelzi a felhasználónak, hogy „mit kellene ide beírni”, és nem a ténylegesen bevitt tartalom.

### A beviteli mezők optimalizálása

Most már használhatók a beviteli mezők, de az alapértelmezett stílusuk viszonylag egyszerű.

Ahhoz, hogy a felület átláthatóbb legyen, hozzáadhatunk egy címet a beviteli mező elé, és magát a mezőt is kicsit egyszerűen formázhatjuk.

Például először adjunk hozzá egy címet:

```swift
Text("Username")
    .fontWeight(.bold)
```

Ezután a `HStack` segítségével helyezzük a címet és a beviteli mezőt egy sorba:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

Itt azért használjuk a `HStack`-et, mert azt szeretnénk, hogy „bal oldalon legyen a cím, jobb oldalon pedig a beviteli mező”.

Fontos megjegyezni, hogy a `TextField` alapértelmezetten elfoglalja a megmaradt szabad helyet.

![color](../../Resource/019_view6.png)

Hogy a két beviteli mező mérete egységesebb legyen, használhatjuk a `frame(width:)` módosítót szélesség megadására, így a mezők rendezettebbnek látszanak.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Ezután adjunk hozzá egy keretet is, hogy a beviteli mező jobban látszódjon:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Most adjuk hozzá mind a felhasználónevet, mind a jelszót a `ContentView` nézethez:

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

Megjelenési eredmény:

![view](../../Resource/019_view4.png)

Eddigre a felhasználó már be tudja írni a felhasználónevet és a jelszót.

## Bejelentkezés gomb

Ezután hozzáadunk egy bejelentkezés gombot a beviteli mezők alá.

```swift
Button("Sign in") {

}
```

Ezután használd a `buttonStyle` módosítót, hogy a gomb feltűnőbb rendszerstílust kapjon:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Megjelenési eredmény:

![view](../../Resource/019_view5.png)

Annak ellenőrzésére, hogy a gomb valóban reagál a koppintásra, először írhatunk egy `print` utasítást a gombba tesztelésként:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

Amikor a gombot megérintjük, a konzol ezt írja ki:

```swift
click Sign in
```

Ez azt mutatja, hogy a gomb sikeresen reagált a koppintásra.

## Bejelentkezési logika

Most hozzáadjuk a bejelentkezés gombhoz a legalapvetőbb ellenőrzési logikát: **ellenőrizzük, hogy a felhasználó megadta-e a felhasználónevet és a jelszót**.

A következő helyzeteket szeretnénk megvalósítani:

- Ha a felhasználó semmit sem adott meg, akkor írjuk ki: `Empty`
- Ha a felhasználó csak az egyik adatot adta meg, jelezzük, melyik hiányzik
- Ha mind a felhasználónév, mind a jelszó meg van adva, akkor írjuk ki: `Success`

### Nincs megadva semmilyen információ

Mivel a `user` és a `password` alapértelmezetten mindketten üres stringek:

```swift
@State private var user = ""
@State private var password = ""
```

ezért ha a felhasználó semmit sem ír be, akkor ezek továbbra is üresek maradnak.

Swiftben az olyan típusok, mint a `String`, használhatják az `isEmpty` tulajdonságot annak eldöntésére, hogy a tartalom üres-e.

### Az isEmpty tulajdonság

Az `isEmpty`-t gyakran használjuk annak ellenőrzésére, hogy a stringek, tömbök és más tartalmak üresek-e.

Például:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

Ha a tartalom üres, az `isEmpty` `true`-t ad vissza; ha a tartalom nem üres, akkor `false`-t ad vissza.

Ezért használhatjuk arra, hogy meghatározzuk, van-e tartalom a felhasználónévben és a jelszóban.

### Az isEmpty használata változók ellenőrzésére

Ha a felhasználó semmilyen információt nem adott meg, akkor:

```swift
user.isEmpty // true
password.isEmpty    // true
```

Ekkor a feltételt így írhatjuk:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

Ez a kód azt jelenti: ha a `user` üres, és a `password` is üres, akkor ezt írjuk ki:

```swift
Empty
```

Itt a `&&` egy logikai operátor, amelynek jelentése „és”.

Vagyis az egész feltétel csak akkor igaz, ha a bal oldali feltétel igaz, és a jobb oldali feltétel is igaz.

Ezért ez a kód csak akkor fut le, ha a felhasználónév és a jelszó is üres.

## A felhasználó csak egy részt töltött ki

Ezután gondoljunk egy másik esetre: a felhasználó csak a felhasználónevet adta meg, vagy csak a jelszót.

Például:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

Ekkor a felhasználónév nem üres, de a jelszó üres.

Továbbra is használhatjuk az `isEmpty`-t az ellenőrzéshez:

### Olyan helyzet, amikor a felhasználó a fiókot vagy a jelszót töltötte ki

Ha a felhasználó csak a felhasználónevet vagy csak a jelszót töltötte ki, akkor megfelelő figyelmeztetést kell adnunk arról, mi hiányzik.

Például ha a felhasználó csak a felhasználónevet töltötte ki:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Ennek a kódnak a logikája az: ha a felhasználónév üres, kérjük be a felhasználónevet. Ellenkező esetben ellenőrizzük, hogy a jelszó üres-e, és ha igen, kérjük be a jelszót.

### A felhasználó minden információt megadott

Ha mind a felhasználónév, mind a jelszó már meg van adva, akkor az `isEmpty` mindkettőre `false` értéket ad vissza.

Ekkor ezt így írhatjuk:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Itt a `!` jelentése „negáció”.

Például:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

Vagyis a `user.isEmpty` arra szolgál, hogy meghatározzuk, „üres-e a felhasználónév”, míg a `!user.isEmpty` arra, hogy meghatározzuk, „nem üres-e a felhasználónév”.

A jelszóra ugyanaz a logika érvényes.

Tehát ennek a kódnak a jelentése az: a felhasználónév nem üres, és a jelszó sem üres.

Amikor mindkét feltétel igaz, a kimenet ez lesz:

```swift
Success
```

## Teljes ellenőrzési logika

Most egyesítsük ezt a három helyzetet, és írjuk be a `Button`-ba:

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

Ennek a kódnak a végrehajtási sorrendje a következőképpen érthető meg:

Első lépésként először ezt ellenőrizzük:

```swift
if user.isEmpty && password.isEmpty
```

Ha a felhasználónév és a jelszó is üres, akkor közvetlenül `Empty` lesz a kimenet.

Ha nem mindkettő üres, akkor ezt a sort ellenőrizzük tovább:

```swift
else if user.isEmpty || password.isEmpty
```

Itt a `||` jelentése „vagy”.

Vagyis amíg az egyik feltétel igaz, addig az egész feltétel igaz.

Ezért amíg a felhasználónév üres, vagy a jelszó üres, az `else if` kódblokk fog lefutni.

Miután beléptünk a kódblokkba, tovább ellenőrizzük, hogy pontosan melyik beviteli mező maradt üresen:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

Ha a két előző feltétel közül egyik sem igaz, az azt jelenti, hogy a felhasználónév nem üres, és a jelszó sem üres.

Ekkor a program az utolsó `else` ágba lép:

```swift
print("Success")
```

Így befejeztük a bejelentkezési bemenet legalapvetőbb ellenőrzési logikáját.

## Felhasználónév és jelszó ellenőrzése

A fenti logika csak azt ellenőrzi, hogy „van-e megadott tartalom vagy sem”.

Egy valódi alkalmazásban azonban nem elég pusztán tartalmat megadni. Általában a felhasználónevet és a jelszót el is kell küldenünk a szervernek ellenőrzésre.

Ha a szerver megerősíti, hogy a felhasználónév létezik és a jelszó helyes, akkor engedélyezi a bejelentkezést; különben jelzi, hogy a bejelentkezés sikertelen volt.

Ennek a folyamatnak a gyakorlására először beállíthatunk a kódban egy ideiglenes fiókot és jelszót, hogy „helyes bejelentkezési adatokat” szimuláljunk:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

Amikor a felhasználónév és a jelszó sem üres, ezután összehasonlíthatjuk, hogy helyesek-e:

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

Itt a `==` jelentése „egyenlő-e”.

Például:

```swift
user == userID
```

Ez azt jelenti: a felhasználó által megadott felhasználónév pontosan megegyezik-e az általunk beállított helyes felhasználónévvel? A jelszó ellenőrzése ugyanilyen logikát követ.

Ezért amikor a megadott felhasználónév és jelszó megegyezik a beállított értékekkel, az eredmény `Success` lesz; amint az egyik nem egyezik, az eredmény `Input error` lesz.

Így elkészítettünk egy egyszerű „szimulált bejelentkezés-ellenőrzést”.

Bár ez még nem egy szerverhez kapcsolt valódi bejelentkezési funkció, már így is bőven elég ahhoz, hogy megértsük: **a gomb megérintése után különböző feltételek alapján különböző kódok futhatnak le**.

## Összefoglalás

Ebben a leckében elkészítettünk egy alapvető bejelentkezési nézetet, és főként arra összpontosítottunk, hogy megtanuljuk „a bevitt tartalom feltételek szerinti megítélésének logikáját”.

Ennek a leckének a központi tartalma: az `isEmpty` használata annak megállapítására, hogy egy string üres-e, valamint az `if` utasítások használata logikai operátorokkal együtt a különböző helyzetek kezelésére.

Ezek közül két nagyon fontos logikai operátor van:

- `&&`: jelentése „és”, mindkét feltételnek teljesülnie kell
- `||`: jelentése „vagy”, elég, ha az egyik feltétel teljesül

Amikor ezek a feltételek végül `true` vagy `false` értéket adnak, az `if` utasítás az eredmény alapján különböző kódokat hajt végre.

Ezen a bejelentkezési nézeten keresztül már elkezdtünk megismerkedni azzal a fejlesztési móddal, amely az „interfész + adatok + logikai döntés” kombinációjára épül.

## Teljes kód

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
