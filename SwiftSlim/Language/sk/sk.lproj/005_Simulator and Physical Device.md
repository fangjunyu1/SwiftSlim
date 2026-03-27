# Simulátor a fyzické zariadenie

Doteraz sme už dokončili vytvorenie základných zobrazení. Hlavným obsahom tejto lekcie je naučiť sa, ako spúšťať App v simulátore a na fyzickom zariadení (Physical Device).

Dodnes si pamätám, ako som bol veľmi šťastný, keď som si prvýkrát nainštaloval App do iPhonu, pretože som mohol oveľa priamočiarejšie vidieť výsledok svojho vývoja. Je to forma pozitívnej spätnej väzby. Keď môžeme používať App, ktoré sme sami vytvorili, záujem nás prirodzene vedie k tomu, aby sme sa učili ešte viac.

Teraz otvorte projekt osobného profilu, ktorý sme dokončili v predchádzajúcej lekcii, a pripravte sa na spustenie v simulátore aj na fyzickom zariadení.

## Simulátor

Xcode má zabudovaných viacero simulátorov, ktoré pokrývajú rôzne modely iPhonu, iPadu a aj Apple Watch. Simulátor sa dá použiť na overenie rozdielov v rozložení App na rôznych modeloch alebo verziách systému.

### Výber simulátora

V zozname zariadení v hornom paneli nástrojov Xcode vyberte simulátor, napríklad iPhone 16.

![Swift](../../RESOURCE/005_xcode.png)

### Spustenie simulátora

Potom kliknite na tlačidlo spustenia v ľavom hornom rohu.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode automaticky zostaví projekt a spustí simulátor.

![Swift](../../RESOURCE/005_xcode2.png)

### Ukončenie simulátora

Ak potrebujete simulátor ukončiť, kliknite na tlačidlo zastavenia v paneli nástrojov Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Simulátor môžete zavrieť aj priamo:

![Swift](../../RESOURCE/005_xcode17.png)

Ak simulátor zavriete priamo, Xcode môže zobraziť hlásenie:

``` id="6l8w1j"
Thread 1: signal SIGTERM
````

Zvyčajne to nie je chyba logiky programu, ale dôsledok toho, že ladený proces bol ukončený zvonka. Vo väčšine prípadov to možno ignorovať, pretože nejde o chybu logiky aplikácie.

V porovnaní s náhľadom v Xcode je simulátor bližší reálnemu prostrediu behu. Stále to však nie je úplné prostredie fyzického zariadenia. Je vhodný na overovanie rozloženia a testovanie prispôsobenia pre viacero modelov.

## Priorita testovacieho prostredia

V skutočnom vývojovom procese by sa malo dodržiavať toto poradie testovania:

fyzické zariadenie > simulátor > náhľad v Xcode

Náhľad je vhodný na rýchle úpravy UI, simulátor je vhodný na štrukturálne testovanie a finálne overenie musí prebehnúť na fyzickom zariadení, najmä pri operáciách súvisiacich s iCloudom.

## Fyzické zariadenie

Náhľad v Xcode aj simulátor môžu v niektorých prípadoch zobrazovať nepresné výsledky, preto má fyzické zariadenie rozhodujúci význam. Systémové oprávnenia, výkon, mechanizmy notifikácií a ďalšie správanie možno plnohodnotne overiť iba na fyzickom zariadení.

### Zapnutie vývojárskeho režimu

Na iPhone:

Nastavenia → Súkromie a bezpečnosť → Vývojársky režim → Zapnúť

![Swift](../../RESOURCE/005_xcode4.png)

Systém zariadenie prinúti reštartovať sa. Bez zapnutého vývojárskeho režimu nebude možné ladenie a spustenie.

### Nastavenie vývojárskeho tímu

Xcode musí mať nastavený vývojársky tím, inak nebude možné aplikáciu podpísať a nainštalovať.

Postup nastavenia:

názov projektu → TARGETS → Signing & Capabilities → Team

Ak sa zobrazuje „Add Account...“, znamená to, že Apple účet ešte nebol pridaný.

![Swift](../../RESOURCE/005_xcode5.png)

Kliknite na tlačidlo pridania a prihláste sa pomocou Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Po prihlásení Apple ID vyberte príslušný účet a dokončite nastavenie vývojárskeho tímu.

![Swift](../../RESOURCE/005_xcode7.png)

### Pripojenie zariadenia

Pomocou kábla pripojte iPhone k Macu.

Pri prvom pripojení:

* Mac sa opýta, či chcete pripojiť iPhone k tomuto Macu
* iPhone sa opýta, či dôverujete tomuto počítaču

Na iPhone musíte klepnúť na „Dôverovať“ a zadať kód zamknutej obrazovky. Potom v zozname zariadení Xcode vyberte svoj iPhone.

![Swift](../../RESOURCE/005_xcode9.png)

Kliknite na tlačidlo spustenia v ľavom hornom rohu.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode zostaví projekt a nainštaluje App do iPhonu.

![Swift](../../RESOURCE/005_view.png)

**Bezdrôtové ladenie**

Od iOS 11 a novších verzií Xcode podporuje bezdrôtové ladenie.

![Swift](../../RESOURCE/005_xcode18.png)

Podmienky:

1. pri prvom párovaní musia byť iPhone a Mac pripojené káblom
2. iPhone a Mac musia byť v rovnakej Wi-Fi sieti
3. obe zariadenia musia zostať odomknuté

Po prvom úspešnom spárovaní cez kábel bude možné neskôr spúšťať App aj po odpojení kábla, pokiaľ budú zariadenia v rovnakej sieti.

Poznámky:

* ak sa zariadenie nezobrazuje v zozname zariadení, môžete kábel znovu pripojiť
* ladenie cez Wi-Fi býva občas nestabilné; ak dôjde k chybe pripojenia, znovu pripojte kábel
* vo firemných alebo izolovaných sieťových prostrediach môže byť táto funkcia obmedzená

## Časté chyby a riešenia

Pri ladení iPhonu cez Xcode sa môžete stretnúť s rôznymi typmi chýb. Nižšie sú uvedené niektoré bežné problémy a zodpovedajúce riešenia, ktoré môžu pomôcť rýchlo určiť a vyriešiť problém s pripojením.

**1. Párovanie nie je dokončené**

```id="v3i1ex"
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

To znamená, že ladenie medzi Xcode a iPhonom ešte nebolo dokončené.

Riešenie: uistite sa, že ste na iPhone klepli na „Dôverovať“. Ak chyba pretrváva, reštartujte Xcode a znovu sa pripojte.

**2. Nie je nastavený vývojársky tím**

```id="j7n6au"
Signing for "SwiftSlimTest" requires a development team.
```

Môže to znamenať, že vývojársky tím nebol nastavený.

Riešenie: v časti Signing & Capabilities vyberte prihlásený účet.

**3. Developer Disk Image sa nepodarilo pripojiť**

```id="ga1b55"
Previous preparation error: The developer disk image could not be mounted on this device.
```

Zvyčajne sa to stáva, keď bol proces inštalácie prerušený, napríklad po odpojení kábla alebo po nútenom zastavení, a pri ďalšej inštalácii vznikne obmedzenie alebo chyba.

Riešenie: reštartujte iPhone a znovu ho pripojte káblom.

**4. Zlyhanie pripojenia ladeného tunela**

```id="58fuqq"
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Táto chyba sa často objavuje pri rušení spôsobenom VPN alebo sieťovým proxy.

Riešenie: vypnite VPN alebo sieťový proxy a skúste to znova.

**5. Zariadenie nie je odomknuté**

```id="qt47fc"
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Zariadenie je uzamknuté. Stačí odomknúť iPhone.

**6. Zariadenie nie je registrované**

```id="h7nj08"
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

To znamená, že zariadenie nebolo pridané do zoznamu zariadení vo vývojárskom účte, takže Xcode preň nemôže vytvoriť platný provisioning profile na podpis a inštaláciu app.

Riešenie: kliknite na „Register Device“ a zariadenie sa zaregistruje automaticky.

**7. Nezhoda verzie nasadenia**

```id="9o2j1d"
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

To znamená, že verzia systému zariadenia je nižšia než minimálna deployment verzia projektu.

Cesta na úpravu:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Upravte verziu tak, aby nebola vyššia než verzia systému zariadenia.

Po úprave vyčistite build priečinok:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Po vyčistení znova spustite projekt.
