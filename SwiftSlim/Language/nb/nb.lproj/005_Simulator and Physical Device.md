# Simulator og fysisk enhet

Så langt har vi fullført byggingen av grunnleggende visninger. Hovedinnholdet i denne leksjonen er å lære hvordan vi kjører en app i simulator og på en fysisk enhet（Physical Device）。

Jeg husker fortsatt hvor glad jeg var første gang jeg installerte en app på iPhone, fordi jeg da kunne se utviklingsresultatet mitt mer direkte. Dette er en positiv tilbakemelding. Når vi kan bruke en app vi selv har laget, vil interessen drive oss til å lære mer.

Åpne nå prosjektet med den personlige CV-siden fra forrige leksjon, og gjør deg klar til å kjøre det i simulator og på fysisk enhet.

## Simulator

Xcode har mange innebygde simulatorer som dekker ulike modeller av iPhone, iPad og Apple Watch. Simulatoren kan brukes til å kontrollere forskjeller i layout på ulike modeller og systemversjoner.

### Velg simulator

Velg en simulator i enhetslisten i verktøylinjen øverst i Xcode（for eksempel iPhone 16）。

![Swift](../../RESOURCE/005_xcode.png)

### Kjør simulatoren

Klikk deretter på kjør-knappen øverst til venstre.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode vil automatisk bygge prosjektet og starte simulatoren.

![Swift](../../RESOURCE/005_xcode2.png)

### Lukk simulatoren

Hvis du trenger å lukke simulatoren, kan du klikke på stoppknappen i Xcodes verktøylinje.

![Swift](../../RESOURCE/005_xcode3.png)

Du kan også lukke simulatoren direkte:

![Swift](../../RESOURCE/005_xcode17.png)

Hvis du lukker simulatoren direkte, kan Xcode vise:

```
Thread 1: signal SIGTERM
```

Dette er vanligvis ikke en logisk feil i programmet, men fordi feilsøkingsprosessen ble avsluttet eksternt. Det kan som regel ignoreres og regnes ikke som en feil i applogikken.

Sammenlignet med Xcode-forhåndsvisning ligger simulatoren nærmere et ekte kjøremiljø. Men det er fortsatt ikke et fullstendig enhetsmiljø. Den passer til layoutkontroll og tilpasningstesting på flere modeller.

## Om prioritet i testmiljøer

I en virkelig utviklingsprosess bør vi følge denne testrekkefølgen:

fysisk enhet > simulator > Xcode-forhåndsvisning

Forhåndsvisning passer til raske UI-justeringer；simulator passer til strukturell testing；endelig verifisering må gjøres på fysisk enhet, spesielt for iCloud-relaterte operasjoner.

## Fysisk enhet

Både Xcode-forhåndsvisning og simulator kan noen ganger vise ting unøyaktig, så fysisk enhet er avgjørende. Systemtillatelser, ytelse, varslingsmekanismer og lignende kan bare verifiseres fullt ut på en virkelig enhet.

### Slå på utviklermodus

På iPhone:

Innstillinger → Personvern og sikkerhet → Utviklermodus → slå på

![Swift](../../RESOURCE/005_xcode4.png)

Systemet vil tvinge enheten til å starte på nytt. Hvis utviklermodus ikke er slått på, vil feilsøkingskjøring ikke være mulig.

### Konfigurer utviklerteam

Xcode må ha et utviklerteam konfigurert, ellers kan ikke appen signeres og installeres.

Konfigurasjonssti:

prosjektnavn → TARGETS → Signing & Capabilities → Team

Hvis "Add Account..." vises, betyr det at ingen Apple-konto er lagt til ennå.

![Swift](../../RESOURCE/005_xcode5.png)

Klikk på legg til-knappen og logg inn med Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Etter at du har logget inn med Apple ID, velger du riktig konto for å fullføre utviklerteamkonfigurasjonen.

![Swift](../../RESOURCE/005_xcode7.png)

### Koble til enheten

Bruk en kabel for å koble iPhone til Mac.

Ved første tilkobling:

- Mac vil spørre om iPhone skal kobles til denne Mac-en
- iPhone vil spørre om du stoler på datamaskinen

Du må trykke “Stol på” på iPhone og skrive inn skjermlåskoden. Deretter velger du iPhone i enhetslisten i Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Klikk på kjør-knappen øverst til venstre.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode vil bygge og installere appen på iPhone.

![Swift](../../RESOURCE/005_view.png)

**Trådløs feilsøking**

Fra og med iOS 11 støtter Xcode trådløs feilsøking.

![Swift](../../RESOURCE/005_xcode18.png)

Forutsetninger:

1. Første paring mellom iPhone og Mac må fullføres med kabel
2. iPhone og Mac må være på samme Wi-Fi-nettverk
3. Begge enhetene må holdes ulåste

Etter at første paring er fullført med kabel, kan du senere kjøre direkte trådløst så lenge de er på samme nettverk, selv om kabelen kobles fra.

Merk:

- Hvis enheten ikke vises i enhetslisten, kan du koble til kabelen igjen
- Wi-Fi-feilsøking kan av og til være ustabil. Hvis forbindelsen feiler, kobler du bare inn kabelen på nytt
- I bedriftsnettverk eller isolerte nettverk kan funksjonen være begrenset

## Vanlige feil og løsninger

Når Xcode kobles til iPhone for feilsøking, kan ulike typer feil dukke opp. Nedenfor er noen vanlige problemer og hvordan de løses, slik at du raskt kan finne og rette tilkoblingsproblemer.

**1. Paringen er ikke fullført**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Dette betyr at feilsøkingsparingen mellom Xcode og iPhone ennå ikke er fullført.

Løsning: bekreft at “Stol på” er trykket på iPhone. Hvis feilen fortsatt vises, start Xcode på nytt og koble til igjen.

**2. Utviklerteam er ikke konfigurert**

```
Signing for "SwiftSlimTest" requires a development team.
```

Det kan være at utviklerteam ikke er konfigurert.

Løsning: velg en innlogget konto i `Signing & Capabilities`。

**3. Developer Disk Image kan ikke monteres**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

Dette skjer vanligvis når installasjonen avbrytes underveis（for eksempel hvis kabelen trekkes ut eller kjøringen stoppes med tvang）, og det oppstår begrensninger ved ny installasjon.

Løsning: start iPhone på nytt og koble til kabelen igjen.

**4. Tilkobling til debug-tunnel mislyktes**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Denne feilen skyldes ofte VPN eller nettverksproxy.

Løsning: slå av VPN eller proxy og prøv igjen.

**5. Enheten er låst**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Enheten er låst. Lås opp iPhone, så skal det fungere.

**6. Enheten er ikke registrert**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Dette betyr at enheten ikke er lagt til i enhetslisten for utviklerkontoen, og Xcode kan derfor ikke generere en gyldig provisioning profile for signering og installasjon av appen.

Løsning: klikk "Register Device" for automatisk registrering.

**7. Ulik distribusjonsversjon**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Dette betyr at systemversjonen på enheten er lavere enn prosjektets minste deployment-versjon.

Endringssti:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Juster versjonen slik at den ikke er høyere enn systemversjonen på enheten.

Rydd deretter byggemappen:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Når ryddingen er ferdig, kjører du prosjektet på nytt.
