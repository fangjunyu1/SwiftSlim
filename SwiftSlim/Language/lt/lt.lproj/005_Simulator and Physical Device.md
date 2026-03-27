# Simuliatorius ir fizinis įrenginys

Iki šiol jau baigėme kurti pagrindinį vaizdą. Šios pamokos pagrindinis tikslas yra išmokti, kaip paleisti App simuliatoriuje ir fiziniame įrenginyje (Physical Device).

Puikiai prisimenu, kaip pirmą kartą įdiegiau App į iPhone — buvau labai laimingas, nes galėjau daug aiškiau pamatyti savo kūrimo rezultatą. Tai buvo teigiamas grįžtamasis ryšys: kai galime naudoti pačių sukurtą programą, susidomėjimas mus skatina savarankiškai mokytis dar daugiau žinių.

Dabar atidarykite praėjusioje pamokoje sukurtą asmeninio gyvenimo aprašymo projektą ir pasiruoškite paleisti jį simuliatoriuje bei fiziniame įrenginyje.

## Simuliatorius

Xcode turi daug įmontuotų simuliatorių, apimančių skirtingus iPhone, iPad ir Apple Watch modelius. Simuliatorius leidžia patikrinti, kaip App sąsaja skiriasi skirtinguose modeliuose ar versijose.

### Simuliatoriaus pasirinkimas

Viršutinėje Xcode įrankių juostoje esančiame įrenginių sąraše pasirinkite vieną simuliatorių (pavyzdžiui, iPhone 16).

![Swift](../../RESOURCE/005_xcode.png)

### Simuliatoriaus paleidimas

Tada spustelėkite paleidimo mygtuką viršutiniame kairiajame kampe.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode automatiškai sukompiliuos projektą ir paleis simuliatorių.

![Swift](../../RESOURCE/005_xcode2.png)

### Simuliatoriaus uždarymas

Jei reikia uždaryti simuliatorių, paspauskite Xcode įrankių juostoje esantį sustabdymo mygtuką.

![Swift](../../RESOURCE/005_xcode3.png)

Taip pat galima tiesiogiai uždaryti patį simuliatorių:

![Swift](../../RESOURCE/005_xcode17.png)

Jei tiesiogiai uždarysite simuliatorių, Xcode gali parodyti pranešimą:

```
Thread 1: signal SIGTERM
```

Dažniausiai tai nėra programos logikos klaida, o tik ženklas, kad derinimo procesas buvo nutrauktas iš išorės. Paprastai tai galima ignoruoti, nes tai nėra pačios programos logikos problema.

Palyginti su Xcode peržiūra, simuliatorius yra arčiau tikros veikimo aplinkos. Tačiau vis tiek tai nėra pilna realaus įrenginio aplinka. Jis tinkamas išdėstymo tikrinimui ir sąsajos pritaikymo testams skirtingiems modeliams.

## Testavimo aplinkos prioritetas

Tikrame kūrimo procese rekomenduojama laikytis tokios testavimo tvarkos:

fizinis įrenginys > simuliatorius > Xcode peržiūra

Peržiūra tinka greitai UI korekcijai; simuliatorius tinka struktūriniam testavimui; galutinis patvirtinimas turi būti atliekamas tik fiziniame įrenginyje, ypač kai kalbama apie iCloud susijusias funkcijas.

## Fizinis įrenginys

Tiek Xcode peržiūra, tiek simuliatorius kartais gali rodyti netikslumus, todėl fizinis įrenginys turi lemiamą reikšmę. Sistemos leidimai, našumas, pranešimų veikimas ir panašus elgesys gali būti pilnai patikrinti tik realiame įrenginyje.

### Įjungti kūrėjo režimą

iPhone įrenginyje:

Nustatymai → Privatumas ir sauga → Kūrėjo režimas → Įjungti

![Swift](../../RESOURCE/005_xcode4.png)

Sistema privers įrenginį persikrauti. Neįjungus kūrėjo režimo, derinimo paleidimo atlikti nepavyks.

### Kūrėjų komandos konfigūracija

Xcode privalo turėti sukonfigūruotą kūrėjų komandą, kitaip App nebus galima pasirašyti ir įdiegti.

Konfigūravimo kelias:

projekto pavadinimas → TARGETS → Signing & Capabilities → Team

Jei rodoma "Add Account...", tai reiškia, kad dar nėra pridėta Apple paskyra.

![Swift](../../RESOURCE/005_xcode5.png)

Paspauskite pridėjimo mygtuką ir prisijunkite su Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Prisijungę prie Apple ID, pasirinkite atitinkamą paskyrą ir užbaikite kūrėjų komandos nustatymą.

![Swift](../../RESOURCE/005_xcode7.png)

### Įrenginio prijungimas

Naudokite laidą, kad prijungtumėte iPhone prie Mac.

Pirmojo prijungimo metu:

- Mac paklaus, ar norite prijungti iPhone prie šio Mac
- iPhone paklaus, ar pasitikite šiuo kompiuteriu

Privalote iPhone įrenginyje pasirinkti „Trust“ ir įvesti užrakto ekrano slaptažodį. Po to Xcode įrenginių sąraše pasirinkite savo iPhone.

![Swift](../../RESOURCE/005_xcode9.png)

Spustelėkite paleidimo mygtuką viršutiniame kairiajame kampe.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode sukompiliuos App ir įdiegs ją į iPhone.

![Swift](../../RESOURCE/005_view.png)

**Belaidis derinimas**

Nuo iOS 11 ir vėlesnių versijų Xcode palaiko belaidį derinimą.

![Swift](../../RESOURCE/005_xcode18.png)

Būtinos sąlygos:

1. Pirmą kartą iPhone ir Mac turi būti suporuoti naudojant duomenų kabelį
2. iPhone ir Mac turi būti tame pačiame Wi-Fi tinkle
3. Abu įrenginiai turi būti atrakinti

Kai pirmasis susiejimas kabeliu jau atliktas, vėliau net ir atjungus laidą, jei įrenginiai yra tame pačiame tinkle, programą bus galima paleisti tiesiogiai.

Svarbūs dalykai:

- Jei įrenginys nerodomas sąraše, galite vėl įjungti kabelinį prijungimą
- Wi-Fi derinimas kartais būna nestabilus, todėl kilus ryšio problemoms dažnai pakanka vėl prijungti laidą
- Įmonių tinkluose ar izoliuotose tinklo aplinkose tai gali būti apribota

## Dažnos klaidos ir jų sprendimai

Kai Xcode prijungia iPhone derinimui, galima susidurti su skirtingo tipo klaidų pranešimais. Žemiau išvardytos kelios dažnos problemos ir atitinkami jų sprendimo būdai, padedantys greičiau nustatyti ir pašalinti ryšio sutrikimus.

**1. Suporavimas dar neužbaigtas**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Tai reiškia, kad Xcode ir iPhone derinimo susiejimas dar nėra baigtas.

Sprendimas: įsitikinkite, kad iPhone jau buvo paspausta „Trust“. Jei klaida vis tiek išlieka, paleiskite Xcode iš naujo ir prijunkite įrenginį dar kartą.

**2. Nesukonfigūruota kūrėjų komanda**

```
Signing for "SwiftSlimTest" requires a development team.
```

Gali būti, kad nėra sukonfigūruota kūrėjų komanda.

Sprendimas: `Signing & Capabilities` skiltyje pasirinkite jau prisijungtą paskyrą.

**3. Nepavyko prijungti Developer Disk Image**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

Dažniausiai taip nutinka, kai diegimo procesas buvo nutrauktas (pvz., atjungtas laidas arba procesas priverstinai sustabdytas), todėl pakartotinio diegimo metu atsiranda apribojimas ir rodoma klaida.

Sprendimas: perkraukite iPhone ir vėl prijunkite jį laidu.

**4. Nepavyko derinimo tunelio ryšys**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Ši klaida dažnai susijusi su VPN arba tinklo tarpinio serverio trikdžiais.

Sprendimas: išjunkite VPN arba tinklo proxy ir pabandykite dar kartą.

**5. Įrenginys neatrakintas**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Įrenginys yra užrakinto ekrano būsenoje, todėl pakanka atrakinti iPhone.

**6. Įrenginys neregistruotas**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Tai reiškia, kad šis įrenginys nėra įtrauktas į kūrėjo paskyros įrenginių sąrašą, todėl Xcode negali sugeneruoti tinkamo profilio App pasirašymui ir įdiegimui.

Sprendimas: spustelėkite "Register Device", kad įrenginys būtų automatiškai užregistruotas.

**7. Nesutampanti diegimo versija**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Tai reiškia, kad įrenginio sistemos versija yra žemesnė nei projekto minimali deployment versija.

Keitimo kelias:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Pakoreguokite versiją taip, kad ji nebūtų aukštesnė už įrenginio sistemos versiją.

Po pakeitimo išvalykite build aplanką:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Baigę valymą, paleiskite iš naujo。
