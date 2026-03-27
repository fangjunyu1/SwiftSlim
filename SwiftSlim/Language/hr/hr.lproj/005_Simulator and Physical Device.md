# Simulator i fizički uređaj

Do sada smo dovršili izradu osnovnog prikaza. Glavni sadržaj ove lekcije je naučiti kako pokrenuti aplikaciju u simulatoru i na fizičkom uređaju (`Physical Device`).

Još se sjećam kako sam bio vrlo sretan kada sam prvi put instalirao aplikaciju na iPhone, jer sam mogao izravnije vidjeti rezultat svog razvoja. To je pozitivan poticaj: kada možemo koristiti aplikaciju koju smo sami razvili, interes nas prirodno potiče da samostalno učimo još više.

Sada otvorite projekt osobnog životopisa koji ste dovršili u prošloj lekciji i pripremite se za pokretanje u simulatoru i na fizičkom uređaju.

## Simulator

Xcode ima ugrađene različite simulatore koji pokrivaju različite modele iPhonea, iPada i Apple Watcha. Simulator može provjeriti razlike u rasporedu sučelja aplikacije na različitim modelima ili verzijama sustava.

### Odabir simulatora

Na popisu uređaja u gornjoj alatnoj traci Xcodea odaberite jedan simulator (na primjer `iPhone 16`).

![Swift](../../RESOURCE/005_xcode.png)

### Pokretanje simulatora

Zatim kliknite gumb za pokretanje u gornjem lijevom kutu.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode će automatski izgraditi projekt i pokrenuti simulator.

![Swift](../../RESOURCE/005_xcode2.png)

### Zatvaranje simulatora

Ako želite zatvoriti simulator, kliknite gumb za zaustavljanje u alatnoj traci Xcodea.

![Swift](../../RESOURCE/005_xcode3.png)

Simulator možete zatvoriti i izravno:

![Swift](../../RESOURCE/005_xcode17.png)

Ako simulator zatvorite izravno, Xcode može prikazati:

```
Thread 1: signal SIGTERM
```

To obično nije greška u logici programa, nego zato što je proces otklanjanja grešaka izvana zaustavljen. U pravilu se to može zanemariti i ne smatra se logičkom greškom aplikacije.

U usporedbi s Xcode pregledom, simulator je bliži stvarnom okruženju izvođenja. Ipak, još uvijek nije potpuno okruženje pravog uređaja. Prikladan je za provjeru rasporeda i testiranje prilagodbe na više uređaja.

## Prioritet testnih okruženja

U stvarnom razvojnom procesu trebalo bi slijediti ovaj redoslijed testiranja:

fizički uređaj > simulator > Xcode pregled

Pregled je prikladan za brzo podešavanje korisničkog sučelja; simulator je prikladan za strukturno testiranje; završna provjera mora se obaviti na fizičkom uređaju, posebno za operacije povezane s iCloudom.

## Fizički uređaj

I Xcode pregled i simulator mogu imati netočnosti u prikazu, pa fizički uređaj ima presudnu važnost. Ponašanja poput sistemskih dozvola, performansi i mehanizma obavijesti mogu se u potpunosti provjeriti samo na fizičkom uređaju.

### Uključivanje developerskog načina rada

Na iPhoneu:

Postavke → Privatnost i sigurnost → Developerski način rada → Uključi

![Swift](../../RESOURCE/005_xcode4.png)

Sustav će prisilno ponovno pokrenuti uređaj. Ako developerski način rada nije uključen, neće biti moguće pokretanje u svrhu debugiranja.

### Konfiguracija developerskog tima

Xcode mora imati konfiguriran developerski tim, inače aplikacija ne može biti potpisana i instalirana.

Put konfiguracije:

Naziv projekta → TARGETS → Signing & Capabilities → Team

Ako se prikazuje "Add Account...", to znači da Apple račun još nije dodan.

![Swift](../../RESOURCE/005_xcode5.png)

Kliknite gumb za dodavanje i prijavite se svojim Apple ID-jem.

![Swift](../../RESOURCE/005_xcode6.png)

Nakon prijave Apple ID-jem odaberite odgovarajući račun i dovršite konfiguraciju developerskog tima.

![Swift](../../RESOURCE/005_xcode7.png)

### Povezivanje uređaja

Spojite iPhone i Mac pomoću kabela.

Pri prvom povezivanju:

- Mac će pitati želite li povezati iPhone s ovim Macom
- iPhone će pitati vjerujete li ovom računalu.

Morate na iPhoneu kliknuti “Trust” i unijeti lozinku zaključanog zaslona. Nakon toga na popisu uređaja u Xcodeu odaberite svoj iPhone.

![Swift](../../RESOURCE/005_xcode9.png)

Kliknite gumb za pokretanje u gornjem lijevom kutu.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode će izgraditi projekt i instalirati aplikaciju na iPhone.

![Swift](../../RESOURCE/005_view.png)

**Bežično debugiranje**

Na iOS-u 11 i novijim verzijama Xcode podržava bežično debugiranje.

![Swift](../../RESOURCE/005_xcode18.png)

Preduvjeti:

1. iPhone i Mac moraju se prvi put upariti pomoću podatkovnog kabela
2. iPhone i Mac moraju biti na istoj Wi-Fi mreži
3. Oba uređaja moraju ostati otključana

Nakon što se prvo uparivanje dovrši pomoću kabela, kasnije, čak i kada se kabel odspoji, aplikacija se može pokretati izravno sve dok su uređaji na istoj mreži.

Napomene:

- Ako se uređaj ne pojavi na popisu uređaja, možete ponovno umetnuti kabel
- Wi-Fi debugiranje ponekad nije stabilno; ako se pojave problemi s povezivanjem, dovoljno je ponovno priključiti kabel
- U poslovnim mrežama ili izoliranim mrežnim okruženjima ova značajka može biti ograničena

## Česte greške i rješenja

Tijekom povezivanja iPhonea s Xcodeom radi debugiranja mogu se pojaviti različite vrste poruka o grešci. U nastavku su navedeni neki česti problemi i odgovarajući načini rješavanja koji mogu pomoći u brzom lociranju i uklanjanju problema s povezivanjem.

**1. Uparivanje nije dovršeno**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

To znači da uparivanje između Xcodea i iPhonea za debugiranje još nije dovršeno.

Rješenje: provjerite jeste li na iPhoneu kliknuli "Trust". Ako se greška i dalje pojavljuje, ponovno pokrenite Xcode i povežite uređaj iznova.

**2. Developerski tim nije konfiguriran**

```
Signing for "SwiftSlimTest" requires a development team.
```

Moguće je da developerski tim nije konfiguriran.

Rješenje: u `Signing & Capabilities` odaberite prijavljeni račun.

**3. Developer Disk Image ne može se montirati**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

To se obično pojavljuje kada je instalacija prekinuta usred procesa (na primjer izvlačenje kabela ili prisilno zaustavljanje), pa zatim kod ponovne instalacije dolazi do ograničenja i greške.

Rješenje: ponovno pokrenite iPhone i ponovno spojite kabel.

**4. Neuspjela veza s debug tunelom**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Ova greška često nastaje zbog utjecaja VPN-a ili mrežnog proxyja.

Rješenje: isključite VPN ili mrežni proxy i pokušajte ponovno.

**5. Uređaj nije otključan**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Uređaj je zaključan; dovoljno je otključati iPhone.

**6. Uređaj nije registriran**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

To znači da uređaj nije dodan na popis uređaja developerskog računa, pa Xcode ne može za njega generirati valjan provisioning profile za potpisivanje i instalaciju aplikacije.

Rješenje: kliknite "Register Device" i automatski ga registrirajte.

**7. Nepodudaranje verzije deploy targeta**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

To znači da je verzija sustava uređaja niža od minimalne verzije deployment targeta projekta.

Put za izmjenu:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Podesite verziju tako da ne bude viša od verzije sustava uređaja.

Nakon izmjene očistite mapu gradnje:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Nakon čišćenja ponovno pokrenite aplikaciju.
