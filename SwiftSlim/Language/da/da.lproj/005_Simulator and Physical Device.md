# Simulator og fysisk enhed

Indtil nu har vi bygget en grundlæggende visning. I denne lektion er hovedindholdet at lære, hvordan man kører en app på simulator og på en fysisk enhed (`Physical Device`).

Jeg kan stadig huske, hvor glad jeg var første gang, jeg installerede en app på min iPhone, fordi jeg så mit udviklingsresultat mere direkte. Det er en form for positiv feedback. Når vi kan bruge en app, vi selv har udviklet, vil interessen ofte skubbe os til at lære endnu mere.

Åbn nu projektet med det personlige CV, som du færdiggjorde i sidste lektion, og gør dig klar til at køre det på simulator og fysisk enhed.

## Simulator

Xcode har flere indbyggede simulatorer, som dækker forskellige modeller af iPhone, iPad og Apple Watch. Simulatoren kan bruges til at kontrollere forskelle i appens layout på tværs af modeller og versioner.

### Vælg simulator

Vælg en simulator i enhedslisten i værktøjslinjen øverst i Xcode, for eksempel iPhone 16.

![Swift](../../RESOURCE/005_xcode.png)

### Kør simulatoren

Klik derefter på kør-knappen øverst til venstre.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode vil automatisk bygge projektet og starte simulatoren.

![Swift](../../RESOURCE/005_xcode2.png)

### Luk simulatoren

Hvis du vil lukke simulatoren, kan du klikke på stop-knappen i Xcodes værktøjslinje.

![Swift](../../RESOURCE/005_xcode3.png)

Du kan også lukke simulatoren direkte:

![Swift](../../RESOURCE/005_xcode17.png)

Hvis du lukker simulatoren direkte, kan Xcode vise:

```
Thread 1: signal SIGTERM
```

Det er normalt ikke en logisk fejl i programmet, men skyldes, at debugprocessen blev afsluttet udefra. Den kan som regel ignoreres og hører ikke til appens egentlige logiske fejl.

Sammenlignet med Xcode Preview ligger simulatoren tættere på et reelt køremiljø, men det er stadig ikke et fuldstændigt enhedsmiljø. Den egner sig til layoutkontrol og tilpasningstest på tværs af flere modeller.

## Om prioriteten mellem testmiljøer

I en rigtig udviklingsproces bør test ske i følgende rækkefølge:

Fysisk enhed > Simulator > Xcode Preview

Preview er velegnet til hurtig justering af UI. Simulatoren er velegnet til strukturelle tests. Den endelige verifikation skal ske på en fysisk enhed, især når det gælder iCloud-relaterede funktioner.

## Fysisk enhed

Både Xcode Preview og simulatoren kan vise unøjagtige resultater. Derfor har en fysisk enhed afgørende betydning. Systemtilladelser, ydeevne og notifikationsmekanismer kan kun verificeres fuldt ud på en rigtig enhed.

### Aktiver udviklertilstand

På iPhone:

Indstillinger → Privatliv og sikkerhed → Udviklertilstand → Aktivér

![Swift](../../RESOURCE/005_xcode4.png)

Systemet vil tvinge enheden til at genstarte. Hvis udviklertilstand ikke er aktiveret, kan du ikke køre debug.

### Konfigurer udviklerteam

Xcode skal konfigureres med et udviklerteam, ellers kan appen ikke signeres og installeres.

Konfigurationssti:

Projektnavn → TARGETS → Signing & Capabilities → Team

Hvis der står "Add Account...", betyder det, at der endnu ikke er tilføjet nogen Apple-konto.

![Swift](../../RESOURCE/005_xcode5.png)

Klik på tilføj-knappen, og log ind med dit Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Når du er logget ind med Apple ID, vælger du den relevante konto for at færdiggøre konfigurationen af udviklerteamet.

![Swift](../../RESOURCE/005_xcode7.png)

### Tilslut enheden

Tilslut din iPhone og din Mac med et kabel.

Første gang du forbinder dem:

- Mac vil spørge, om iPhone skal forbindes til denne Mac
- iPhone vil spørge, om den skal stole på denne computer

Du skal trykke "Tillid" på iPhone og indtaste skærmlåskoden. Derefter vælger du din iPhone i enhedslisten i Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Klik på kør-knappen øverst til venstre.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode bygger projektet og installerer appen på iPhone.

![Swift](../../RESOURCE/005_view.png)

**Trådløs debugging**

I iOS 11 og nyere understøtter Xcode trådløs debugging.

![Swift](../../RESOURCE/005_xcode18.png)

Forudsætninger:

1. iPhone og Mac skal første gang parres med kabel
2. iPhone og Mac skal være på samme Wi-Fi-netværk
3. Begge enheder skal være oplåste

Når første parring er gennemført med kabel, kan du senere køre direkte trådløst, så længe de er på samme netværk, også selv om kablet er fjernet.

Bemærkninger:

- Hvis enheden ikke vises i enhedslisten, kan du tilslutte kablet igen
- Wi-Fi-debugging er af og til ustabil. Hvis forbindelsen fejler, er det som regel nok at sætte kablet i igen
- På virksomhedsnetværk eller isolerede netværk kan denne funktion være begrænset

## Almindelige fejl og løsninger

Når Xcode forbindes til en iPhone for debugging, kan der opstå forskellige fejlmeddelelser. Nedenfor er nogle almindelige problemer og deres løsninger, som kan hjælpe med hurtigt at finde og løse forbindelsesproblemer.

**1. Parring er ikke fuldført**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Det betyder, at debugparringen mellem Xcode og iPhone endnu ikke er færdig.

Løsning: Kontroller, at du har trykket "Tillid" på iPhone. Hvis fejlen stadig vises, så genstart Xcode og forbind igen.

**2. Udviklerteam er ikke konfigureret**

```
Signing for "SwiftSlimTest" requires a development team.
```

Det kan skyldes, at der ikke er konfigureret et udviklerteam.

Løsning: Vælg en konto, du er logget ind med, under `Signing & Capabilities`.

**3. Developer Disk Image kan ikke monteres**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

Det sker ofte, hvis installationsprocessen blev afbrudt undervejs, for eksempel hvis kablet blev fjernet, eller processen blev stoppet med magt. Det kan derefter give fejl ved geninstallation.

Løsning: Genstart iPhone, og tilslut den igen med kabel.

**4. Fejl i debugtunnelforbindelsen**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Denne fejl skyldes ofte VPN eller netværksproxy.

Løsning: Slå VPN eller proxy fra, og prøv igen.

**5. Enheden er ikke låst op**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Enheden er låst. Lås iPhone op, så er det normalt nok.

**6. Enheden er ikke registreret**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Det betyder, at enheden ikke er tilføjet til listen over enheder i din udviklerkonto, og Xcode kan derfor ikke generere en gyldig provisioning profile til signering og installation.

Løsning: Klik på "Register Device" for automatisk at registrere enheden.

**7. Uoverensstemmelse i deployment-version**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Det betyder, at enhedens systemversion er lavere end projektets minimum deployment-version.

Ændringssti:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Sæt versionen til ikke at være højere end enhedens systemversion.

Når det er gjort, skal du rydde build-mappen:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Når oprydningen er færdig, kan du køre projektet igen.
