# A persely összegének mentése

Az előző leckében elkészítettünk egy egyszerű „perselyt”. Ebben a leckében azt tanuljuk meg, hogyan lehet a persely összegét tartósan elmenteni.

A lecke fő témái a `UserDefaults` és az `@AppStorage` property wrapper, emellett kitérünk az `onAppear` szerepére és az optional típus (`nil`) használatára is.

Fontos megjegyezni, hogy ehhez a leckéhez az előző részben elkészített „persely” kódját használjuk tovább.

## A tartós mentés problémája

Most a „persely” felülete egyszerű és kényelmesen használható.

![Piggy Bank](../../Resource/014_view.png)

Van azonban egy nyilvánvaló probléma: minden alkalommal, amikor a nézet frissül vagy az alkalmazás bezárul, a persely teljes összege visszaáll 0-ra, és az összes korábban elmentett összeg elveszik.

Ez azt jelenti, hogy az adat nincs valóban elmentve. Másképp fogalmazva: a mostani „persely” csak ideiglenes adatokat képes tárolni.

### Miért nem marad meg tartósan?

Ennek az az oka, hogy az összeget `@State` változóban tároljuk:

```swift
@State private var amount = 0
```

Az `@State`-tel deklarált változó életciklusa teljes mértékben a nézettől függ.

Amikor a nézet létrejön, az `amount` 0-ra inicializálódik; amikor a nézet megszűnik, az `amount` is megsemmisül.

Az `amount` által tárolt adat tehát csak a memóriában létezik, és nincs elmentve az eszközre.

Ha azt szeretnénk, hogy az `amount` ne a nézet életciklusához legyen kötve, akkor tartós adatmentést kell megvalósítanunk, vagyis az adatot magára az eszközre kell elmentenünk.

### Mit jelent az „adatok perzisztálása”

Az adatperzisztencia egyszerűen úgy érthető, mint az adat áthelyezése az „ideiglenes memóriából” az „eszköz tárhelyére”.

Így amikor a nézet vagy maga az alkalmazás bezárul, az adat nem vész el.

Swift fejlesztésben az egyszerűbb tartós adatmentéshez a `UserDefaults` használható, a bonyolultabb adatoknál pedig `SwiftData` vagy `CoreData` jön szóba.

Ebben a leckében a legegyszerűbb megoldással, a `UserDefaults`-szal kezdünk.

## UserDefaults

A `UserDefaults` könnyű, kulcs-érték párok tárolására szolgál, és általában `String`, `Int`, `Double`, `Bool` típusú alapadatok mentésére használják.

### Adatok mentése

A `UserDefaults` a `set` metódust használja mentésre:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

A `UserDefaults` első paramétere a mentendő adat, itt például `String`, `Int` vagy más alap típus.

A második paraméter, a `forKey`, hasonló egy változónévhez, és azt azonosítja, hogy milyen kulcs alatt tárolódik az adat.

### Adatok kiolvasása

A `UserDefaults` a megfelelő típushoz tartozó metódusokkal olvassa ki az adatot:

```swift
let name = UserDefaults.standard.string(forKey: "name")	// FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")	// 28
let isMember = UserDefaults.standard.bool(forKey: "isMember")	// true
```

Kiolvasáskor mindig a megfelelő típushoz tartozó metódust kell használni, különben az adat hibás lehet, vagy a lekérés nem a várt eredményt adja.

### Fontos tudnivalók a UserDefaults-ról

#### 1. Optional visszatérési érték

Amikor a `UserDefaults`-ból olvasunk adatot, bizonyos metódusok optional típust adnak vissza.

Például:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

A `name` típusa ekkor:

```swift
String?
```

Ez azt jelenti, hogy lehet értéke, de az is lehet, hogy nincs.

**Miért optional a visszatérés?**

Azért, mert előfordulhat, hogy a `UserDefaults` adott kulcshoz nem tartozik mentett adat.

Például:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

Ha korábban soha nem mentettünk adatot `"City"` kulccsal, akkor a lekérés eredménye:

```swift
nil
```

Fontos hangsúlyozni, hogy a `nil` azt jelenti: nincs adat, és nem azt, hogy üres karakterlánc.

A „típusrendszer” leckében már találkoztunk hasonló esettel: ha egy típuskonverzió nem sikerül, optional típust kapunk vissza.

Ilyenkor a `??` segítségével alapértelmezett értéket adhatunk, vagyis kicsomagolhatjuk az optionalt:

```swift
let name = UserDefaults.standard.string(forKey: "City")	?? "Rizhao"
```

Ha a `UserDefaults` tud értéket olvasni, azt használja; ha nem tud, vagyis `nil`, akkor az alapértelmezett értéket veszi.

#### 2. Nem optional visszatérési érték

Ha a `UserDefaults` `Int`, `Double` vagy `Bool` típust olvas ki, akkor nem optional típust ad vissza.

Például:

```swift
let num = UserDefaults.standard.integer(forKey: "num")	// 0
let height = UserDefaults.standard.double(forKey: "height")	// 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar")	// false
```

Még akkor sem `nil` az eredmény, ha ezekhez a kulcsokhoz soha nem lett adat mentve.

Ilyenkor alapértelmezett értéket kapunk:

```swift
Int → 0
Double → 0.0
Bool → false
```

#### 3. Az adatmennyiség korlátozása

A `UserDefaults` csak kis mennyiségű adat tárolására alkalmas, például alkalmazásbeállításokra vagy egyszerű állapotokra.

A gyakorlatban nem megfelelő nagy mennyiségű adat vagy gyakran változó adatok mentésére.

## A „persely” összegének mentése

Most már használhatjuk a `UserDefaults`-ot arra, hogy elmentsük a persely teljes összegét.

Amikor a felhasználó megnyomja a gombot, a beírt összeg hozzáadódik a teljes összeghez, majd ezt a teljes összeget elmentjük a `UserDefaults`-ba.

```swift
Button("Save") {
    amount += number
    number = 0
	UserDefaults.standard.set(amount, forKey: "amount")	// UserDefaults
}
.buttonStyle(.borderedProminent)
```

Most elkészült az adatírás logikája.

## A tartós mentés logikájának magyarázata

Bár a mentési logikát már hozzáadtuk, a gyakorlatban azt fogjuk látni, hogy a nézet frissítésekor vagy az app újranyitásakor az `amount` továbbra is 0 lesz.

Ennek oka:

```swift
@State private var amount = 0
```

SwiftUI-ban az `@State` változó a nézet létrehozásakor újrainicializálódik.

Vagyis hiába van már elmentve az `amount` értéke a `UserDefaults`-ban, a nézet újratöltésekor az `amount` változó ismét 0-ra áll.

Ez azt jelenti, hogy jelenleg csak elmentettük az adatot a `UserDefaults`-ba, de nem állítottuk vissza azt a nézetben.

Ezért amikor a nézet betöltődik, kézzel is ki kell olvasnunk a `UserDefaults`-ban tárolt értéket, és hozzá kell rendelnünk az `amount` változóhoz. Csak így lesz teljes a tartós mentési logika.

### Logikai hasonlat

Képzeljük el ezt a folyamatot úgy, mint egy tantermi táblát:

Az óra közben a tanár felírja az anyagot a táblára. Ez olyan, mint az aktuális nézet állapota (`@State`).

Amikor az óra véget ér, a táblát letörlik, hogy a következő órára üres legyen. Ez megfelel annak, amikor a nézet megszűnik, és az `@State` adata is törlődik.

Annak érdekében, hogy az anyag ne vesszen el, a tanár előre elmenti azt a tananyagba. Ez felel meg a `UserDefaults`-ban tárolt adatnak.

Amikor a következő órán újra kezdődik a tanítás, a tábla először üres (`@State` újrainicializálódik), és a tanárnak a tananyag alapján újra fel kell írnia a korábbi anyagot a táblára. Ez a `UserDefaults` kiolvasása.

Fontos megérteni, hogy a tábla nem áll vissza magától. Csak a „tananyag beolvasásával”, vagyis a `UserDefaults` kiolvasásával kerül vissza az adat.

## Az adatok betöltése onAppear használatával

Amikor a nézet megjelenik, kézzel kell kiolvasni a `UserDefaults` értékét, és azt az `@State` `amount` változóhoz rendelni, hogy valóban megvalósuljon a tartós adatkezelés.

SwiftUI-ban az `onAppear` segítségével futtathatunk inicializáló logikát, amikor a nézet megjelenik:

```swift
.onAppear {}
```

Tegyük a `UserDefaults` kiolvasását az `onAppear` blokkba:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

Amikor a nézet létrejön, az `amount` kezdetben 0 lesz; amikor a nézet megjelenik, lefut az `onAppear`, amely kiolvassa a `UserDefaults`-ból a korábban elmentett értéket, és visszatölti az `amount` változóba.

Ezzel a nézet már képes megjeleníteni az előzőleg elmentett teljes összeget.

Mostanra a „persely” teljes tartós adatmentési logikája elkészült.

## Teljes kód

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## Az @AppStorage property wrapper

A SwiftUI biztosít egy `@AppStorage` property wrappert, amely leegyszerűsíti a `UserDefaults` mentési logikáját.

```
@AppStorage("amount") private var amount = 0
```

Az `@AppStorage` lényegében a `UserDefaults` SwiftUI-s csomagolása, és az `"amount"` a `UserDefaults` kulcsának felel meg.

Amikor a nézet létrejön, automatikusan kiolvassa az adatot a `UserDefaults`-ból; amikor a változó értéke megváltozik, automatikusan vissza is írja oda.

Támogatja a SwiftUI állapotfrissítési mechanizmusát is, vagyis ugyanúgy frissíti a nézetet, mint az `@State`.

Más szóval az `@AppStorage` egyszerre oldja meg az adat beolvasását és mentését, ezért többé nincs szükség kézi `UserDefaults` hívásokra, és `onAppear`-re sem az adatok betöltéséhez.

Ezért a korábbi `UserDefaults` logikát lecserélhetjük `@AppStorage`-ra:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

## Összegzés

Ebben a leckében elsősorban a következőket tanultuk meg:

Először is, a `UserDefaults` könnyű adatok tárolására használható, és mi ezt használtuk arra, hogy a teljes összeget az eszközre mentsük. A `UserDefaults` olvasási és írási metódusokat biztosít, és közben az optional típusok kezelésére is figyelni kell.

Másodszor, az `@State` változó csak a nézet ideiglenes állapotának kezelésére alkalmas, és az életciklusa a nézethez kötődik. Amikor a nézet újra létrejön, az `@State` is újrainicializálódik.

Az elmentett `UserDefaults` adatok visszatöltéséhez megismertük az `onAppear` használatát, amely a nézet megjelenésekor fut le.

Végül az `@AppStorage` segítségével lecseréltük a kézi `UserDefaults` logikát, így a nézet betöltésekor az adat automatikusan beolvasódik, változáskor pedig automatikusan mentődik.

Ezekkel az ismeretekkel már meg tudunk valósítani egy alapvető alkalmazásszintű adattárolási megoldást, amelyben az adatok tartósan megmaradnak.

## Lecke utáni gyakorlás

Most a „persely” már képes az összeget elmenteni, de a funkciója még nem teljes.

1. Ha a felhasználó pénzt szeretne kivenni, ehhez külön logikát kell tervezni.
2. Ha a felhasználó teljesen nullázni szeretné az összeget, ehhez is szükség van egy visszaállító logikára.
3. Ha nevet is szeretnénk adni a perselynek, akkor `String` típusú adat mentését is be kell vezetnünk.

Ezekkel a bővítésekkel még teljesebb és használhatóbb lehet a „persely”.

## Kiegészítő ismeret - A beviteli mező alapértelmezett értékének problémája

Most már az inputmező használatát is tovább finomíthatjuk, hogy a bevitel kényelmesebb legyen.

![textfield](../../Resource/015_view.png)

A jelenlegi megoldásban a beviteli mező alapértelmezett értéke 0.

Ez azt jelenti, hogy a felhasználónak minden egyes összeg beírása előtt először ki kell törölnie a 0-t, és csak utána írhat be új számot. Ez nem túl jó felhasználói élmény.

Sokkal jobb, ha a beviteli mező alapból üres, nem pedig 0-t mutat.

Ennek oka, hogy a `TextField` és a `number` változó kétirányú kötésben vannak:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

Ha a `number` kezdetben 0, akkor a `TextField` is 0-t fog megjeleníteni.

Ezért a `number` kezdeti értékét üressé kell tennünk, vagyis `nil`-re:

```swift
@State private var number = nil
```

Ekkor viszont hiba jelenik meg:

```
Generic parameter 'Value' could not be inferred
```

Pontosan ez az a helyzet, amiről a „típusrendszer” leckében beszéltünk: ha a változó típusát a fordító nem tudja automatikusan kitalálni, akkor explicit módon meg kell adnunk.

Mivel a `number` értékét `nil`-re állítottuk, és a `nil` önmagában nem hordoz típust, a fordító nem tudja eldönteni, hogy ez `String`, `Int` vagy valami más legyen. Ezért hibát jelez.

Ennélfogva explicit módon meg kell adnunk a típust:

```swift
@State private var number:Int? = nil
```

Itt az `Int?` optional típust jelent, vagyis a `number` lehet `Int`, de lehet `nil` is.

Így ha kezdetben `nil`, akkor a beviteli mező üres marad, nem 0-t mutat.

### Optional kicsomagolása

Amikor a `number` optional típusra változik, az eredeti számítási kód hibát fog adni:

```swift
amount += number
```

A hibaüzenet:

```swift
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

Ennek az az oka, hogy a `number` most már lehet `nil` is. Ha közvetlenül részt venne a számításban, az lényegében ezt jelentené:

```swift
amount += nil
```

Nyilvánvaló, hogy a `nil` nem adható hozzá az `amount` értékéhez, tehát ez érvénytelen művelet.

Ezért amikor optional típust számításban használunk, előbb ki kell csomagolni.

Erre itt a `??` jó megoldás, mert alapértelmezett értéket adhat:

```swift
amount += number ?? 0
```

Ha a `number` `nil`, akkor 0 lesz felhasználva. Ha van értéke, akkor a ténylegesen beírt összeg kerül számításba.

Így a számítás helyes marad, miközben a beviteli mező alapértelmezés szerint üres lehet, és a felhasználónak nem kell minden alkalommal kézzel törölnie a 0-t.

## Kiegészítő kód

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number ?? 0
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```
