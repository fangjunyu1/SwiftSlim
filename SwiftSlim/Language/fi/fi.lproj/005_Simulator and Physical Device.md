# Simulaattori ja fyysinen laite

Tähän mennessä olemme jo rakentaneet perusnäkymiä. Tämän luvun pääsisältö on oppia ajamaan sovellusta simulaattorissa ja fyysisellä laitteella (`Physical Device`).

Muistan yhä, kuinka iloinen olin ensimmäisellä kerralla, kun asensin sovelluksen iPhoneen. Oli hienoa nähdä oma kehitystyö konkreettisesti toiminnassa. Se on positiivista palautetta: kun pääsemme käyttämään itse tekemäämme sovellusta, kiinnostus saa meidät oppimaan lisää aivan luonnostaan.

Avaa nyt edellisessä luvussa tekemäsi henkilökohtainen CV-projekti ja valmistaudu ajamaan sitä simulaattorissa ja fyysisellä laitteella.

## Simulaattori

Xcodessa on sisäänrakennettuna useita simulaattoreita eri iPhone-, iPad- ja Apple Watch -malleille. Simulaattorin avulla voidaan tarkistaa sovelluksen käyttöliittymän eroja eri malleissa ja versioissa.

### Simulaattorin valitseminen

Valitse Xcoden ylätyökalurivin laiteluettelosta jokin simulaattori, esimerkiksi `iPhone 16`.

![Swift](../../RESOURCE/005_xcode.png)

### Simulaattorin ajaminen

Paina sen jälkeen vasemman yläkulman ajopainiketta.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode rakentaa projektin automaattisesti ja käynnistää simulaattorin.

![Swift](../../RESOURCE/005_xcode2.png)

### Simulaattorin sulkeminen

Jos haluat sulkea simulaattorin, paina Xcoden työkalurivin stop-painiketta.

![Swift](../../RESOURCE/005_xcode3.png)

Voit myös sulkea simulaattorin suoraan:

![Swift](../../RESOURCE/005_xcode17.png)

Jos suljet simulaattorin suoraan, Xcode saattaa näyttää viestin:

```text
Thread 1: signal SIGTERM
```

Tämä ei tavallisesti ole ohjelman logiikkavirhe, vaan johtuu siitä, että debug-prosessi lopetettiin ulkopuolelta. Se voidaan yleensä jättää huomiotta, eikä se kuulu sovelluksen logiikkavirheisiin.

Xcoden esikatseluun verrattuna simulaattori on lähempänä todellista ajoympäristöä. Se ei kuitenkaan vieläkään ole täysin sama asia kuin oikea laite. Se sopii käyttöliittymän tarkistamiseen ja eri laitemallien testaamiseen.

## Testiympäristöjen tärkeysjärjestys

Todellisessa kehitysprosessissa testaus kannattaa tehdä tässä järjestyksessä:

Fyysinen laite > Simulaattori > Xcode-esikatselu

Esikatselu sopii nopeisiin käyttöliittymämuutoksiin; simulaattori rakenteelliseen testaukseen; ja lopullinen varmistus täytyy tehdä fyysisellä laitteella, erityisesti iCloudiin liittyvissä toiminnoissa.

## Fyysinen laite

Sekä Xcoden esikatselu että simulaattori voivat näyttää epätarkkoja tuloksia, joten fyysisellä laitteella on ratkaiseva merkitys. Järjestelmän oikeudet, suorituskyky ja ilmoitusmekanismit voidaan todentaa täydellisesti vain oikealla laitteella.

### Kehittäjätilan avaaminen

iPhonessa:

Asetukset → Tietosuoja ja turvallisuus → Kehittäjätila → Ota käyttöön

![Swift](../../RESOURCE/005_xcode4.png)

Järjestelmä käynnistää laitteen pakotetusti uudelleen. Jos kehittäjätilaa ei ole otettu käyttöön, sovellusta ei voi ajaa debug-tilassa.

### Kehittäjätiimin määrittäminen

Xcodeen on määritettävä kehittäjätiimi, muuten sovellusta ei voi allekirjoittaa ja asentaa.

Määrityspolku:

Projektin nimi → `TARGETS` → `Signing & Capabilities` → `Team`

Jos näkyy `Add Account...`, Apple-tiliä ei ole vielä lisätty.

![Swift](../../RESOURCE/005_xcode5.png)

Paina lisäämispainiketta ja kirjaudu sisään Apple ID:llä.

![Swift](../../RESOURCE/005_xcode6.png)

Kun olet kirjautunut sisään, valitse vastaava tili ja viimeistele kehittäjätiimin määritys.

![Swift](../../RESOURCE/005_xcode7.png)

### Laitteen yhdistäminen

Yhdistä iPhone ja Mac kaapelilla.

Ensimmäisellä kerralla:

- Mac kysyy, haluatko yhdistää iPhonen tähän Maciin
- iPhone kysyy, luotatko tähän tietokoneeseen

Sinun täytyy painaa iPhonessa “Luota” ja syöttää lukitusnäytön salasana. Sen jälkeen valitse oma iPhonesi Xcoden laiteluettelosta.

![Swift](../../RESOURCE/005_xcode9.png)

Paina vasemman yläkulman ajopainiketta.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode rakentaa sovelluksen ja asentaa sen iPhoneen.

![Swift](../../RESOURCE/005_view.png)

**Langaton debuggaus**

iOS 11:stä lähtien Xcode tukee langatonta debuggausta.

![Swift](../../RESOURCE/005_xcode18.png)

Edellytykset:

1. iPhone ja Mac täytyy parittaa ensimmäisellä kerralla kaapelilla
2. iPhonen ja Macin täytyy olla samassa Wi‑Fi-verkossa
3. Molempien laitteiden täytyy pysyä avattuina

Kun ensimmäinen kaapeliparitus on tehty, kaapelin voi myöhemmin irrottaa ja sovellusta voi ajaa suoraan niin kauan kuin laitteet ovat samassa verkossa.

Huomioitavaa:

- Jos laite ei näy laiteluettelossa, yhdistä kaapeli uudelleen
- Wi‑Fi-debuggaus voi olla ajoittain epävakaa; jos yhteys epäonnistuu, kaapelin uudelleenkytkentä auttaa yleensä
- Yritysverkot tai eristetyt verkot voivat rajoittaa tätä toimintoa

## Yleiset virheet ja ratkaisut

Kun iPhone yhdistetään Xcodeen debuggausta varten, voi esiintyä monenlaisia virheilmoituksia. Alla on muutamia yleisiä ongelmia ja niiden ratkaisut, joiden avulla yhteysongelmat on helpompi paikallistaa ja korjata nopeasti.

**1. Paritus ei ole valmis**

```text
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Tämä tarkoittaa, että Xcoden ja iPhonen välinen debug-paritus ei ole vielä valmis.

Ratkaisu: varmista, että iPhonessa on painettu “Luota”. Jos virhe jatkuu, käynnistä Xcode uudelleen ja yhdistä laite uudestaan.

**2. Kehittäjätiimiä ei ole määritetty**

```text
Signing for "SwiftSlimTest" requires a development team.
```

Syynä voi olla se, ettei kehittäjätiimiä ole määritetty.

Ratkaisu: valitse `Signing & Capabilities` -kohdassa sisäänkirjautunut tili.

**3. Developer Disk Imagea ei voi liittää**

```text
Previous preparation error: The developer disk image could not be mounted on this device.
```

Tämä ilmenee yleensä silloin, kun asennusprosessi keskeytyy, esimerkiksi kaapeli irtoaa tai toiminto pysäytetään väkisin, minkä jälkeen uudelleenasennus epäonnistuu.

Ratkaisu: käynnistä iPhone uudelleen ja yhdistä kaapeli takaisin.

**4. Debug-tunnelin yhteys epäonnistui**

```text
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Tämä virhe liittyy usein VPN:n tai verkkovälityspalvelimen aiheuttamaan häiriöön.

Ratkaisu: poista VPN tai verkkovälityspalvelin käytöstä ja yritä uudelleen.

**5. Laite ei ole avattu**

```text
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Laite on lukitusnäytössä. Ratkaisu on yksinkertaisesti avata iPhone.

**6. Laitetta ei ole rekisteröity**

```text
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Tämä tarkoittaa, ettei kyseistä laitetta ole lisätty kehittäjätilin laitelistaan, jolloin Xcode ei voi luoda sille kelvollista profiilia sovelluksen allekirjoittamista ja asennusta varten.

Ratkaisu: paina `Register Device`, jolloin laite rekisteröidään automaattisesti.

**7. Deployment-versio ei täsmää**

```text
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Tämä tarkoittaa, että laitteen käyttöjärjestelmäversio on alempi kuin projektin vähimmäisdeployment-versio.

Muokkauspolku:

`TARGETS` → `General` → `Deployment Info` → `Deployment Target`

![Swift](../../RESOURCE/005_xcode15.png)

Säädä versio sellaiseksi, ettei se ole laitteen järjestelmäversiota korkeampi.

Muutoksen jälkeen puhdista build-kansio:

`Product` → `Clean Build Folder Immediately`

![Swift](../../RESOURCE/005_xcode16.png)

Kun puhdistus on valmis, aja projekti uudelleen.
