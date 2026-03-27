# Simulator in fizična naprava

Do zdaj smo že dokončali izdelavo osnovnega pogleda. Glavna vsebina te lekcije je, da se naučimo, kako zagnati aplikacijo v simulatorju in na fizični napravi (Physical Device).

Še vedno se spomnim, kako vesel sem bil, ko sem prvič namestil aplikacijo na iPhone, saj sem lahko veliko bolj neposredno videl rezultat svojega razvoja. To je pozitivna povratna informacija — ko lahko uporabljamo aplikacijo, ki smo jo sami razvili, nas zanimanje pogosto spontano žene k temu, da se učimo še več.

Zdaj odprite projekt osebnega življenjepisa, ki ste ga dokončali v prejšnji lekciji, in se pripravite na zagon v simulatorju in na fizični napravi.

## Simulator

Xcode ima vgrajenih več simulatorjev, ki pokrivajo različne modele iPhone, iPad in Apple Watch. Simulator lahko pomaga preveriti razlike v postavitvi aplikacije na različnih modelih ali različicah sistema.

### Izbira simulatorja

V seznamu naprav v zgornji orodni vrstici Xcode izberite simulator, na primer iPhone 16.

![Swift](../../RESOURCE/005_xcode.png)

### Zagon simulatorja

Nato kliknite gumb za zagon v zgornjem levem kotu.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode bo samodejno zgradil projekt in zagnal simulator.

![Swift](../../RESOURCE/005_xcode2.png)

### Zapiranje simulatorja

Če želite zapreti simulator, kliknite gumb za zaustavitev v orodni vrstici Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Lahko pa simulator tudi neposredno zaprete:

![Swift](../../RESOURCE/005_xcode17.png)

Če simulator zaprete neposredno, lahko Xcode prikaže sporočilo:

``` id="vjjmtd"
Thread 1: signal SIGTERM
````

To običajno ni napaka v logiki programa, ampak pomeni, da je bil proces odpravljanja napak zunanje prekinjen. V večini primerov lahko to prezrete, saj ne gre za napako v logiki aplikacije.

V primerjavi s predogledom v Xcode je simulator bližje resničnemu okolju izvajanja, vendar še vedno ni popolno okolje fizične naprave. Primeren je za preverjanje postavitve in prilagajanje različnim modelom naprav.

## O prioriteti testnih okolij

V dejanskem razvojnem procesu je priporočljivo upoštevati naslednji vrstni red testiranja:

fizična naprava > simulator > predogled v Xcode

Predogled je primeren za hitro prilagajanje uporabniškega vmesnika, simulator za strukturno testiranje, končno preverjanje pa mora biti opravljeno na fizični napravi, še posebej pri operacijah, povezanih z iCloud.

## Fizična naprava

Tako predogled v Xcode kot simulator lahko včasih prikažeta netočne rezultate, zato ima fizična naprava odločilen pomen. Obnašanje sistemskih dovoljenj, zmogljivosti, obvestil in podobnega je mogoče v celoti preveriti samo na fizični napravi.

### Vklop načina za razvijalce

Na iPhonu:

Nastavitve → Zasebnost in varnost → Način za razvijalce → Vklopi

![Swift](../../RESOURCE/005_xcode4.png)

Sistem bo prisilno znova zagnal napravo. Če način za razvijalce ni vklopljen, odpravljanje napak in zagon ne bosta mogoča.

### Nastavitev razvijalske ekipe

Xcode mora imeti nastavljeno razvijalsko ekipo, sicer aplikacije ne bo mogoče podpisati in namestiti.

Pot nastavitve:

ime projekta → TARGETS → Signing & Capabilities → Team

Če je prikazano "Add Account...", to pomeni, da Apple račun še ni dodan.

![Swift](../../RESOURCE/005_xcode5.png)

Kliknite gumb za dodajanje in se prijavite z Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Po prijavi z Apple ID izberite ustrezen račun in dokončajte nastavitev razvijalske ekipe.

![Swift](../../RESOURCE/005_xcode7.png)

### Povezava naprave

Povežite iPhone in Mac s kablom.

Ob prvi povezavi:

* Mac bo vprašal, ali želite iPhone povezati s tem Macom
* iPhone bo vprašal, ali zaupate temu računalniku

Na iPhonu morate klikniti »Zaupaj« in vnesti geslo za zaklenjeni zaslon. Nato v seznamu naprav v Xcode izberite svoj iPhone.

![Swift](../../RESOURCE/005_xcode9.png)

Kliknite gumb za zagon v zgornjem levem kotu.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode bo zgradil projekt in namestil aplikacijo na iPhone.

![Swift](../../RESOURCE/005_view.png)

**Brezžično odpravljanje napak**

V iOS 11 in novejših različicah Xcode podpira brezžično odpravljanje napak.

![Swift](../../RESOURCE/005_xcode18.png)

Predpogoji:

1. iPhone in Mac morata biti pri prvi seznanitvi povezana s podatkovnim kablom
2. iPhone in Mac morata biti v istem omrežju Wi-Fi
3. Obe napravi morata ostati odklenjeni

Ko je prva seznanitev enkrat opravljena prek kabla, lahko pozneje, tudi če kabel odklopite, aplikacijo še vedno zaženete neposredno, če sta napravi v istem omrežju.

Opombe:

* Če se naprava ne prikaže na seznamu naprav, lahko kabel znova priključite
* Odpravljanje napak prek Wi-Fi je občasno nestabilno; če pride do težav s povezavo, ponovno priklopite kabel
* V službenih omrežjih ali izoliranih omrežjih je ta funkcija lahko omejena

## Pogoste napake in rešitve

Ko Xcode povežete z iPhonom za odpravljanje napak, lahko naletite na različne vrste napak. Spodaj je navedenih nekaj pogostih težav in ustreznih načinov reševanja, ki vam lahko pomagajo hitro locirati in odpraviti težave s povezavo.

**1. Seznanitev ni dokončana**

```id="z2vnh4"
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

To pomeni, da seznanitev med Xcode in iPhonom za odpravljanje napak še ni bila dokončana.

Rešitev: preverite, ali ste na iPhonu kliknili »Zaupaj«. Če se napaka še vedno pojavlja, znova zaženite Xcode in ponovno povežite napravo.

**2. Razvijalska ekipa ni nastavljena**

```id="h5opvm"
Signing for "SwiftSlimTest" requires a development team.
```

Možno je, da razvijalska ekipa ni bila nastavljena.

Rešitev: v Signing & Capabilities izberite račun, s katerim ste prijavljeni.

**3. Developer Disk Image ni bilo mogoče priklopiti**

```id="iej4dm"
Previous preparation error: The developer disk image could not be mounted on this device.
```

To se običajno zgodi, kadar je bil postopek namestitve prekinjen, na primer zaradi odklopa kabla ali prisilne zaustavitve, zaradi česar se pri ponovnem nameščanju pojavi omejitev in napaka.

Rešitev: znova zaženite iPhone in ga ponovno povežite s kablom.

**4. Povezava prek tunela za odpravljanje napak ni uspela**

```id="ahp3s0"
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Ta napaka je pogosto povezana z motnjami zaradi VPN-ja ali omrežnega posrednika.

Rešitev: izklopite VPN ali omrežni posrednik in poskusite znova.

**5. Naprava ni odklenjena**

```id="nqhk1n"
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Naprava je zaklenjena. Dovolj je, da odklenete iPhone.

**6. Naprava ni registrirana**

```id="ri0m2s"
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

To pomeni, da naprava ni bila dodana na seznam naprav v razvijalskem računu, zato Xcode zanjo ne more ustvariti veljavnega provisioning profila za podpisovanje in namestitev aplikacije.

Rešitev: kliknite "Register Device", da jo samodejno registrirate.

**7. Neujemanje različice za namestitev**

```id="cku952"
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

To pomeni, da je različica sistema na napravi nižja od najnižje različice, nastavljene v projektu.

Pot za spremembo:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Različico prilagodite tako, da ne bo višja od različice sistema na napravi.

Po spremembi očistite mapo za gradnjo:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Ko je čiščenje končano, aplikacijo znova zaženite.
