# Szimulátor és fizikai eszköz

Mostanra már elkészítettük az alapnézetet. Ennek a leckének a fő témája, hogy megtanuljuk, hogyan futtassuk az alkalmazást a szimulátoron és egy fizikai eszközön (`Physical Device`).

Emlékszem, amikor először telepítettem egy appot az iPhone-omra, nagyon boldog voltam, mert így sokkal közvetlenebbül láthattam a fejlesztés eredményét. Ez egy pozitív visszajelzés: amikor használhatjuk a saját alkalmazásunkat, az érdeklődés természetes módon arra ösztönöz, hogy még többet tanuljunk.

Most nyisd meg az előző leckében elkészített személyes önéletrajz projektet, és készülj fel a szimulátoros és fizikai eszközös futtatásra.

## Szimulátor

Az Xcode számos beépített szimulátort tartalmaz, különböző iPhone, iPad és Apple Watch modellekkel. A szimulátor segítségével ellenőrizhető, hogyan viselkedik az alkalmazás felülete eltérő készülékeken és rendszerverziókon.

### Szimulátor kiválasztása

Az Xcode felső eszköztárában lévő eszközlistából válassz egy szimulátort, például `iPhone 16`.

![Swift](../../RESOURCE/005_xcode.png)

### Szimulátor indítása

Ezután kattints a bal felső sarokban lévő futtatás gombra.

![Swift](../../RESOURCE/005_xcode1.png)

Az Xcode automatikusan buildeli a projektet, majd elindítja a szimulátort.

![Swift](../../RESOURCE/005_xcode2.png)

### Szimulátor leállítása

Ha le szeretnéd állítani a szimulátort, kattints az Xcode eszköztárában a stop gombra.

![Swift](../../RESOURCE/005_xcode3.png)

Magát a szimulátort közvetlenül is bezárhatod:

![Swift](../../RESOURCE/005_xcode17.png)

Ha közvetlenül zárod be a szimulátort, az Xcode ezt jelezheti:

```
Thread 1: signal SIGTERM
```

Ez általában nem programlogikai hiba, hanem azért jelenik meg, mert a hibakeresési folyamatot kívülről leállították. Többnyire figyelmen kívül hagyható, és nem alkalmazáslogikai hibát jelent.

Az Xcode előnézetéhez képest a szimulátor közelebb áll a valódi futási környezethez, de továbbra sem teljes értékű eszközkörnyezet. Jól használható az elrendezés ellenőrzésére és a különböző készülékekhez való igazítás tesztelésére.

## A tesztkörnyezetek fontossági sorrendje

A valódi fejlesztési folyamatban érdemes a következő tesztelési sorrendet követni:

fizikai eszköz > szimulátor > Xcode előnézet

Az előnézet gyors UI-finomhangolásra alkalmas; a szimulátor szerkezeti tesztelésre jó; a végső ellenőrzést viszont mindig fizikai eszközön kell elvégezni, különösen iCloudhoz kapcsolódó műveleteknél.

## Fizikai eszköz

Az Xcode előnézete és a szimulátor is mutathat pontatlanságokat, ezért a fizikai eszköznek döntő jelentősége van. Rendszerengedélyek, teljesítmény, értesítési mechanizmusok és más viselkedések csak valódi eszközön ellenőrizhetők teljesen.

### Fejlesztői mód bekapcsolása

Az iPhone-on:

Beállítások → Adatvédelem és biztonság → Fejlesztői mód → Bekapcsolás

![Swift](../../RESOURCE/005_xcode4.png)

A rendszer kényszerített újraindítást fog végrehajtani. Fejlesztői mód nélkül nem lehet hibakereséssel futtatni.

### Fejlesztői csapat beállítása

Az Xcode-ban be kell állítani a fejlesztői csapatot, különben az alkalmazást nem lehet aláírni és telepíteni.

A beállítás menete:

Projekt neve → TARGETS → Signing & Capabilities → Team

Ha itt az `"Add Account..."` felirat látható, az azt jelenti, hogy még nincs Apple-fiók hozzáadva.

![Swift](../../RESOURCE/005_xcode5.png)

Kattints a hozzáadás gombra, és jelentkezz be az Apple ID-ddal.

![Swift](../../RESOURCE/005_xcode6.png)

Miután beléptél az Apple ID-val, válaszd ki a megfelelő fiókot, és fejezd be a fejlesztői csapat beállítását.

![Swift](../../RESOURCE/005_xcode7.png)

### Eszköz csatlakoztatása

Kábellel csatlakoztasd az iPhone-t a Machez.

Első csatlakozáskor:

- a Mac megkérdezi, hogy szeretnéd-e csatlakoztatni az iPhone-t ehhez a Machez
- az iPhone pedig megkérdezi, hogy megbízol-e ebben a számítógépben

Az iPhone-on kötelező a „Trust” lehetőséget választani és megadni a zárolási jelkódot. Ezután az Xcode eszközlistájában válaszd ki az iPhone-odat.

![Swift](../../RESOURCE/005_xcode9.png)

Kattints a bal felső sarokban a futtatás gombra.

![Swift](../../RESOURCE/005_xcode1.png)

Az Xcode buildeli a projektet, majd telepíti az alkalmazást az iPhone-ra.

![Swift](../../RESOURCE/005_view.png)

**Vezeték nélküli hibakeresés**

Az iOS 11 és az azt követő verziók esetén az Xcode támogatja a vezeték nélküli hibakeresést.

![Swift](../../RESOURCE/005_xcode18.png)

Előfeltételek:

1. az iPhone-t és a Macet első alkalommal mindenképpen kábellel kell párosítani
2. az iPhone és a Mac ugyanazon a Wi-Fi hálózaton legyen
3. mindkét eszköz maradjon feloldott állapotban

Miután az első párosítás kábellel megtörtént, később már a kábel kihúzása után is közvetlenül futtathatsz, amennyiben ugyanabban a hálózati környezetben vannak.

Fontos tudnivalók:

- ha az eszköz nem jelenik meg az eszközlistában, dugd vissza a kábelt és csatlakoztasd újra
- a Wi-Fi hibakeresés néha instabil lehet, ilyenkor egyszerűen csatlakoztasd újra kábellel
- vállalati hálózat vagy elkülönített hálózati környezet korlátozhatja ezt a funkciót

## Gyakori hibák és megoldások

Amikor az Xcode-dal iPhone-hoz csatlakozol hibakeresés céljából, különféle hibaüzenetekkel találkozhatsz. Az alábbiakban néhány gyakori problémát és a hozzájuk tartozó megoldást soroljuk fel, hogy gyorsabban azonosítható és elhárítható legyen a csatlakozási hiba.

**1. A párosítás még nem fejeződött be**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Ez azt jelzi, hogy az Xcode és az iPhone közötti hibakeresési párosítás még nem fejeződött be.

Megoldás: ellenőrizd, hogy az iPhone-on rányomtál-e a „Trust” lehetőségre. Ha a hiba továbbra is fennáll, indítsd újra az Xcode-ot, majd csatlakozz ismét.

**2. Nincs beállítva fejlesztői csapat**

```
Signing for "SwiftSlimTest" requires a development team.
```

Lehetséges, hogy nincs beállítva fejlesztői csapat.

Megoldás: a `Signing & Capabilities` résznél válaszd ki a már bejelentkezett fiókot.

**3. A Developer Disk Image nem csatolható**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

Ez általában akkor jelenik meg, ha a telepítési folyamat megszakadt, például kábelkihúzás vagy kényszerleállítás miatt, és az újratelepítés korlátozásba ütközik.

Megoldás: indítsd újra az iPhone-t, majd csatlakoztasd újra kábellel.

**4. A hibakeresési alagút kapcsolata sikertelen**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Ez a hiba gyakran VPN vagy hálózati proxy zavarása miatt fordul elő.

Megoldás: kapcsold ki a VPN-t vagy a hálózati proxyt, majd próbáld újra.

**5. Az eszköz nincs feloldva**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Az eszköz zárolt képernyőn van, elég feloldani az iPhone-t.

**6. Az eszköz nincs regisztrálva**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Ez azt jelenti, hogy az eszköz nincs hozzáadva a fejlesztői fiók eszközlistájához, ezért az Xcode nem tud érvényes provisioning profile-t létrehozni az alkalmazás aláírásához és telepítéséhez.

Megoldás: kattints a `"Register Device"` gombra az automatikus regisztrációhoz.

**7. A telepítési verzió nem egyezik**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Ez azt jelenti, hogy az eszköz rendszerverziója alacsonyabb, mint a projekt minimális telepítési verziója.

A módosítás útvonala:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Állítsd a verziót nem magasabbra, mint az eszköz rendszerverziója.

A módosítás után tisztítsd meg a build mappát:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

A tisztítás után futtasd újra a projektet.
