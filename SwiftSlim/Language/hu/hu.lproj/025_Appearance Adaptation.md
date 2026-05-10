# Megjelenéshez való alkalmazkodás

Ebben a leckében megtanuljuk, hogyan igazodik a felület a világos módhoz és a sötét módhoz.

iPhone-on, iPaden és Macen a felhasználók választhatnak világos módot vagy sötét módot.

Amikor a rendszer sötét módra vált, sok App háttere, szövege és ikonja is ennek megfelelően változik.

Például nappal a felület világos hátteret használhat, éjszaka pedig sötét háttérre válthat.

![view](../../../Resource/025_view9.png)

Ezt a képességet, vagyis hogy a felület a rendszer megjelenéséhez igazodva automatikusan módosítja a megjelenítést, megjelenéshez való alkalmazkodásnak nevezzük.

## Megjelenés előnézete Xcode-ban

Mielőtt megtanulnánk a megjelenéshez való alkalmazkodást, először nézzük meg, hogyan lehet előnézetben megtekinteni a világos módot és a sötét módot Xcode-ban.

A `Canvas` terület alján kattints a `Device Settings` gombra, ezzel megnyithatod a `Canvas Device Settings` felugró ablakot.

![canvas](../../../Resource/025_view.png)

A felugró ablakban látható a `Color Scheme` beállítás.

![canvas1](../../../Resource/025_view1.png)

Ezek jelentése:

- A `Light Appearance` világos módot jelent.
- A `Dark Appearance` sötét módot jelent.

Itt átválthatjuk az előnézeti megjelenést, és megnézhetjük, hogyan néz ki az aktuális felület világos módban és sötét módban.

## Két megjelenés egymás melletti megjelenítése

Ha egyszerre szeretnéd látni a világos módot és a sötét módot, használhatod a `Variants` funkciót.

A `Canvas` terület alján kattints a `Variants` gombra, majd válaszd a `Color Scheme Variants` lehetőséget.

![canvas2](../../../Resource/025_view2.png)

A kiválasztás után a `Canvas` egyszerre jeleníti meg a világos mód és a sötét mód előnézetét.

![canvas3](../../../Resource/025_view3.png)

Így könnyebb összehasonlítani a két megjelenés közötti felületi különbségeket.

Egyszerűen fogalmazva:

Ha csak ideiglenesen szeretnél váltani a világos és a sötét mód között, használhatod a `Canvas Device Settings` lehetőséget.

Ha egyszerre szeretnéd látni mindkét megjelenést, használhatod a `Color Scheme Variants` lehetőséget.

## A nézetek alapértelmezés szerint alkalmazkodnak a megjelenéshez

SwiftUI-ban sok rendszernézet alapértelmezés szerint automatikusan alkalmazkodik a világos módhoz és a sötét módhoz.

Például:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lightbulb")
                .font(.system(size: 100))

            Text("Világos")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("valami valami valami")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Megjelenítési eredmény:

![canvas](../../../Resource/025_view4.png)

Látható, hogy világos módban az ikonok és a címek általában sötét színnel jelennek meg.

Sötét módban az ikonok és a címek automatikusan világos színűvé válnak.

Ennek az az oka, hogy a `Text`, az `Image` és más SwiftUI-nézetek alapértelmezés szerint a rendszer megjelenése alapján állítják be a színeiket.

Más szóval, ha nem adunk meg kézzel rögzített színt, a SwiftUI a megjelenéshez való alkalmazkodás egy részét elvégzi helyettünk.

## A rögzített színek nem váltanak automatikusan

Fontos megjegyezni, hogy ha kézzel adunk meg egy rögzített színt, az nem fog automatikusan váltani világos mód és sötét mód között.

Például:

```swift
Text("valami valami valami")
	.foregroundStyle(Color.gray)
```

Itt a szöveg `Color.gray` értékre van állítva, ezért mindig szürkén fog megjelenni.

Egy másik példa:

```swift
Text("Cím")
    .foregroundStyle(Color.white)
```

Ez a kód világos módban és sötét módban is fehér szöveget jelenít meg.

Ha a háttér is világos, a fehér szöveg nehezen olvashatóvá válhat.

Ezért a megjelenéshez való alkalmazkodás során lehetőleg kerüljük a `Color.white`, `Color.black` és hasonló rögzített színek könnyelmű beégetését.

Sok esetben érdemes előnyben részesíteni a rendszer szemantikus stílusait, például:

```swift
.foregroundStyle(.primary)
.foregroundStyle(.secondary)
```

Ezek jelentése:

- A `.primary` általában az elsődleges tartalomhoz használható.
- A `.secondary` általában a másodlagos tartalomhoz használható.

Ezek automatikusan módosítják a megjelenítésüket a világos mód és a sötét mód alapján.

## Eltérő tartalom megjelenítése a megjelenés alapján

Néha nemcsak azt szeretnénk, hogy a színek változzanak, hanem azt is, hogy különböző megjelenések alatt eltérő tartalom jelenjen meg.

Például:

- Világos módban egy normál villanykörte ikont jelenítünk meg.
- Sötét módban egy világító villanykörte ikont jelenítünk meg.
- Világos módban a cím `Világos` legyen.
- Sötét módban a cím `Sötét` legyen.

Ilyenkor meg kell határoznunk, hogy az aktuális rendszer világos módban vagy sötét módban van-e.

SwiftUI-ban az aktuális megjelenési módot a `colorScheme` környezeti értéken keresztül kaphatjuk meg:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Teljes kód:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    private var imageName: String {
        colorScheme == .light ? "lightbulb" : "lightbulb.max"
    }

    private var titleName: String {
        colorScheme == .light ? "Világos" : "Sötét"
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .font(.system(size: 100))

            Text(titleName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("valami valami valami")
                .font(.title)
                .foregroundStyle(.gray)
        }
    }
}
```

Megjelenítési eredmény:

![view](../../../Resource/025_view5.png)

Az előnézeti eredményből látható, hogy ugyanaz a nézet különböző megjelenési módokban nem teljesen ugyanazt a tartalmat jeleníti meg.

Világos módban az `Image` a normál villanykörte ikont jeleníti meg, a cím pedig `Világos` lesz.

Sötét módban az `Image` a világító villanykörte ikont jeleníti meg, a cím pedig `Sötét` lesz.

Más szóval, itt nemcsak a szín változik. Maga az ikon neve és a cím szövege is megváltozik.

Ez azért van, mert az ikont és a címet nem közvetlenül a `body` belsejében égettük be, hanem a `colorScheme` alapján különböző tartalmat számítunk ki.

Ebben a kódban két számított tulajdonságot használunk:

```swift
private var imageName: String {
    colorScheme == .light ? "lightbulb" : "lightbulb.max"
}
```

```swift
private var titleName: String {
    colorScheme == .light ? "Világos" : "Sötét"
}
```

Amikor a `colorScheme` értéke `.light`, az azt jelenti, hogy az aktuális mód világos mód.

Amikor a `colorScheme` értéke `.dark`, az azt jelenti, hogy az aktuális mód sötét mód.

Ezért a különböző megjelenési módok alapján eltérő ikonneveket és címszöveget adhatunk vissza.

Ez a számított tulajdonságok egyik gyakori felhasználása is: az aktuális állapot alapján kiszámítjuk, milyen tartalmat kell a nézetnek megjelenítenie.

## Az @Environment megértése

Most találkozunk először az `@Environment` használatával.

Az `@Environment` úgy érthető, mint egy érték kiolvasása a SwiftUI környezetéből.

Amikor egy App fut, a rendszer sokféle környezeti információt biztosít, például:

- Aktuális nyelv
- Aktuális megjelenési mód
- Aktuális elrendezési irány
- Aktuális betűméret-beállítás

Amikor meg kell kapnunk az aktuális megjelenési módot, kiolvashatjuk a `colorScheme` értéket:

```swift
@Environment(\.colorScheme) private var colorScheme
```

Itt:

```swift
\.colorScheme
```

azt jelenti, hogy a környezetből kiolvassuk a `colorScheme` értéket.

```swift
private var colorScheme
```

azt jelenti, hogy a kiolvasott értéket a `colorScheme` változóba mentjük.

A változó nevét saját magad döntheted el. Például így is írhatod:

```swift
@Environment(\.colorScheme) private var currentColorScheme
```

Amíg az elöl lévő `\.colorScheme` nem változik, ez azt jelenti, hogy az aktuális megjelenési módot olvasod ki.

## A colorScheme két gyakori értéke

A `colorScheme` gyakran két értékkel rendelkezik:

```swift
.light
.dark
```

Ezek jelentése:

- `.light`: világos mód
- `.dark`: sötét mód

Például:

```swift
private var titleName: String {
    colorScheme == .light ? "Világos" : "Sötét"
}
```

Ez a kód azt jelenti:

Ha az aktuális mód világos mód, akkor a `colorScheme == .light` igaz, ezért a visszatérési érték `"Világos"`.

Ellenkező esetben a visszatérési érték `"Sötét"`.

Ezért világos módban:

```swift
Text(titleName)
```

A megjelenített szöveg:

```swift
Világos
```

Sötét módban a megjelenített szöveg:

```swift
Sötét
```

Ilyen módon különböző megjelenések alapján eltérő tartalmat jeleníthetünk meg.

## Példa színadaptációra

A szöveg és az ikonok mellett néha a színadaptációt is saját magunknak kell kezelnünk.

Például:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Szöveg")
                .font(.system(size: 100))
                .foregroundStyle(Color.white)
                .padding(50)
                .background(Color.black)
                .cornerRadius(50)
        }
    }
}
```

Megjelenítési eredmény:

![view](../../../Resource/025_view6.png)

Ebben a kódban a szöveg fehér, a háttér pedig fekete.

Világos módban a fekete háttér elég egyértelmű.

Sötét módban viszont, ha az egész felület háttere is fekete, ez a fekete háttér beleolvad a rendszer hátterébe, és kevésbé lesz világos.

Ekkor a megjelenési mód alapján válthatjuk a szövegszínt és a háttérszínt:

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var textColor: Color {
        color == .light ? Color.white : Color.black
    }

    var backgroundColor: Color {
        color == .light ? Color.black : Color.white
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Szöveg")
                .font(.system(size: 100))
                .foregroundStyle(textColor)
                .padding(50)
                .background(backgroundColor)
                .cornerRadius(50)
        }
    }
}
```

Megjelenítési eredmény:

![view](../../../Resource/025_view7.png)

Most világos módban fekete háttér és fehér szöveg látható.

Sötét módban fehér háttér és fekete szöveg látható.

Így bármelyik megjelenést használjuk, a szöveg és a háttér között egyértelmű kontraszt van, és a felhasználók tisztán láthatják a tartalmat.

## Assets használata a színek adaptálásához

A `colorScheme` kézi ellenőrzése mellett az `Assets` erőforrásszíneit is használhatjuk a világos módhoz és a sötét módhoz való alkalmazkodáshoz.

Ez a módszer alkalmasabb az Appban közösen használt színek kezelésére.

Az Xcode-projektben keresd meg az `Assets` erőforrásmappát.

![assets](../../../Resource/025_color.png)

Nyisd meg az `Assets` mappát, kattints jobb gombbal egy üres területre, majd válaszd a `New Color Set` lehetőséget egy új színerőforrás létrehozásához.

![assets](../../../Resource/025_color1.png)

Itt létrehozunk egy színt, és `redText` néven nevezzük el.

![assets](../../../Resource/025_color2.png)

Egy színerőforráshoz külön beállítható a világos mód és a sötét mód színe.

![assets](../../../Resource/025_color3.png)

A megfelelő színterület kiválasztása után a jobb oldali attribútumvizsgálóban módosíthatod a színt.

Kattints a jobb felső sarokban lévő `Hide or show the Inspectors` gombra az ellenőrzőterület megnyitásához.

Ezután válaszd a `Show the Attributes inspector` lehetőséget, alul keresd meg a `Show Color Panel` elemet, és nyisd meg a színpanelt.

![assets](../../../Resource/025_color4.png)

Kattints egy színre a színpanelen, és a `redText` megfelelő színterülete ezzel együtt megváltozik.

Itt a `redText` értékét így állítjuk be:

- Világos módban piros szín jelenjen meg
- Sötét módban zöld szín jelenjen meg

![assets](../../../Resource/025_color5.png)

Visszatérve a SwiftUI-kódhoz, ezt a színt így használhatod:

```swift
struct ContentView: View {
    var body: some View {
        Color("redText")
            .frame(width: 300, height: 300)
            .cornerRadius(100)
    }
}
```

Itt:

```swift
Color("redText")
```

azt jelenti, hogy az `Assets` közül kiolvassuk a `redText` nevű színerőforrást.

Megjelenítési eredmény:

![assets](../../../Resource/025_view8.png)

Látható, hogy ugyanaz a `Color("redText")` világos módban és sötét módban eltérő színt jelenít meg.

Ez azt mutatja, hogy az `Assets` színei önmagukban is támogatják a megjelenéshez való alkalmazkodást.

## A colorScheme és az Assets különbsége

A `colorScheme` és az `Assets` is megvalósíthatja a megjelenéshez való alkalmazkodást, de eltérő helyzetekre alkalmasak.

Ha csak a szöveges tartalmat, a képneveket vagy az `SF Symbols` neveit kell váltani világos mód és sötét mód alapján, használhatod a `colorScheme` értéket.

Például:

```swift
colorScheme == .light ? "lightbulb" : "lightbulb.max"
```

Ha egy színt gyakran használsz az Appban, például témaszínként, kártyaháttérként vagy szövegszínként, inkább az `Assets` színek használata ajánlott.

Ennek oka, hogy az `Assets` színek több nézetben is újrahasználhatók, és később könnyebb őket módosítani.

Például:

```swift
Color("redText")
```

Így csak az `Assets` területén kell módosítani a színt, és minden hely, amely ezt a színt használja, együtt fog megváltozni.

## Összefoglalás

Ebben a leckében megtanultuk a világos mód és a sötét mód megjelenéshez való alkalmazkodását.

Először megtanultuk, hogyan lehet különböző megjelenéseket előnézetben megtekinteni az Xcode `Canvas` területén, és hogyan lehet a `Color Scheme Variants` használatával egyszerre látni a világos módot és a sötét módot.

Ezután megtanultuk, hogy a SwiftUI `Text`, `Image` és hasonló nézetei alapértelmezés szerint automatikusan alkalmazkodnak a színeikkel a rendszer megjelenéséhez.

Ha azonban kézzel adunk meg rögzített színeket, például `Color.white` vagy `Color.black`, ezek a színek nem fognak automatikusan váltani.

Ezután megtanultuk az `@Environment` és a `colorScheme` használatát:

```swift
@Environment(\.colorScheme) private var colorScheme
```

A `colorScheme` segítségével meghatározhatjuk, hogy az aktuális mód világos mód vagy sötét mód, és különböző megjelenések alapján eltérő ikonokat, szöveget vagy színeket jeleníthetünk meg.

Végül megtanultuk az `Assets` színek használatát.

Az `Assets` színeknél külön beállíthatók a világos mód és a sötét mód színei, ezért alkalmasak az Appban közösen használt színerőforrások kezelésére.

A megjelenéshez való alkalmazkodás révén az App nappal és éjszaka is jobb megjelenést kaphat, és elkerülhetők az olyan problémák, mint az olvashatatlan szöveg vagy a nem eléggé elkülönülő háttér.

Valós fejlesztés során ajánlott először a SwiftUI alapértelmezett alkalmazkodási képességét és az `Assets` színeket használni.

Ha különböző megjelenések alatt szöveget, ikonokat, képeket kell váltani, vagy néhány speciális megjelenítési hatást kell kezelni, akkor érdemes a `colorScheme` alapján ellenőrizni.

## Kiegészítő tudás: betűméret megadása

Amikor korábban a `font` használatát tanultuk, néhány rendszer betűstílust használtunk:

```swift
Text("FangJunyu")
	.font(.largeTitle)

Text("FangJunyu")
	.font(.callout)
```

A `.largeTitle`, `.callout` és hasonló rendszer betűstílusok használata mellett kézzel is megadhatod a betűméretet.

Például:

```swift
Image(systemName: "lightbulb")
    .font(.system(size: 100))
```

Itt:

```swift
.font(.system(size: 100))
```

azt jelenti, hogy a betűméretet `100 pt` értékre állítjuk.

Az `SF Symbols` ikonok esetében a `font` szintén befolyásolja az ikon méretét.

Ezért ha azt szeretnéd, hogy az ikon nagyobb legyen, a `.font(.system(size:))` segítségével megadhatod a méretet.

Például:

```swift
Image(systemName: "star.fill")
    .font(.system(size: 80))
```

Fontos megjegyezni, hogy bár a betűméret kézi megadása rugalmasabb, normál szövegnél nem ajánlott nagy mennyiségben rögzített betűméreteket használni.

Normál szövegnél részesítsd előnyben a `.title`, `.headline`, `.body`, `.caption` és hasonló rendszer betűstílusokat.

Így jobban lehet alkalmazkodni a különböző eszközökhöz és a felhasználó betűméret-beállításaihoz.
