# Simulator en fysiek apparaat

Tot nu toe hebben we het bouwen van de basisweergave voltooid. De hoofdinhoud van deze les is leren hoe je een app uitvoert op de simulator en op een fysiek apparaat (Physical Device).

Ik herinner me nog dat ik erg blij was toen ik voor het eerst een app op een iPhone installeerde, omdat ik mijn ontwikkelresultaat dan veel directer kon zien. Dat is een vorm van positieve feedback: wanneer we een app kunnen gebruiken die we zelf hebben ontwikkeld, zal interesse ons vanzelf stimuleren om meer te leren.

Open nu het cv-project dat we in de vorige les hebben gemaakt en bereid je voor om het op de simulator en op een fysiek apparaat uit te voeren.

## Simulator

Xcode heeft meerdere ingebouwde simulators, waaronder verschillende modellen iPhone, iPad en Apple Watch. De simulator kan verschillen in interface-indeling tussen verschillende modellen of versies verifiëren.

### Een simulator kiezen

Kies in de apparaatlijst bovenaan in de Xcode-werkbalk een simulator (bijvoorbeeld iPhone 16).

![Swift](../../RESOURCE/005_xcode.png)

### De simulator uitvoeren

Klik daarna op de Run-knop linksboven.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode bouwt het project automatisch en start de simulator.

![Swift](../../RESOURCE/005_xcode2.png)

### De simulator sluiten

Als je de simulator wilt sluiten, klik je op de Stop-knop in de Xcode-werkbalk.

![Swift](../../RESOURCE/005_xcode3.png)

Je kunt de simulator ook direct sluiten:

![Swift](../../RESOURCE/005_xcode17.png)

Als je de simulator direct sluit, kan Xcode deze melding geven:

```swift
Thread 1: signal SIGTERM
```

Dit is meestal geen fout in de applogica, maar ontstaat doordat het debugproces extern is beëindigd. Meestal kun je dit negeren; het hoort niet bij een logische fout van de app.

Vergeleken met Xcode Preview ligt de simulator dichter bij de echte uitvoeromgeving. Toch is het nog steeds geen volledig echte apparaatomgeving. Hij is geschikt voor lay-outverificatie en aanpassingstests voor meerdere modellen.

## Over de prioriteit van testomgevingen

In een echte ontwikkelworkflow moet je de volgende testvolgorde aanhouden:

`Fysiek apparaat > simulator > Xcode Preview`

Preview is geschikt voor het snel aanpassen van UI; de simulator is geschikt voor structurele tests; de uiteindelijke verificatie moet op een fysiek apparaat gebeuren, vooral bij iCloud-gerelateerde handelingen.

## Fysiek apparaat

Zowel Xcode Preview als de simulator kunnen onnauwkeurige weergave geven, daarom heeft een fysiek apparaat een doorslaggevende betekenis. Systeemrechten, prestaties, notificatiemechanismen en andere gedragingen kunnen alleen op een echt apparaat volledig worden geverifieerd.

### Ontwikkelaarsmodus inschakelen

Op de iPhone:

`Instellingen → Privacy en beveiliging → Ontwikkelaarsmodus → Inschakelen`

![Swift](../../RESOURCE/005_xcode4.png)

Het systeem zal het apparaat verplicht opnieuw opstarten. Zonder ingeschakelde ontwikkelaarsmodus kun je niet debuggen en uitvoeren.

### Het ontwikkelaarsteam configureren

Xcode moet een ontwikkelaarsteam hebben geconfigureerd, anders kan de app niet worden ondertekend en geïnstalleerd.

Configuratiepad:

`Projectnaam → TARGETS → Signing & Capabilities → Team`

Als "Add Account..." wordt weergegeven, betekent dit dat er nog geen Apple-account is toegevoegd.

![Swift](../../RESOURCE/005_xcode5.png)

Klik op de knop Toevoegen en log in met je Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Nadat je bent ingelogd met je Apple ID, kies je het juiste account om de configuratie van het ontwikkelaarsteam te voltooien.

![Swift](../../RESOURCE/005_xcode7.png)

### Het apparaat verbinden

Gebruik een kabel om de iPhone met de Mac te verbinden.

Bij de eerste verbinding:

* De Mac vraagt of de iPhone met deze Mac mag worden verbonden
* De iPhone vraagt of deze computer wordt vertrouwd

Je moet op de iPhone op "Vertrouw" tikken en vervolgens de toegangscode van het vergrendelscherm invoeren. Daarna kies je je iPhone in de apparatenlijst van Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Klik op de Run-knop linksboven.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode bouwt de app en installeert deze op de iPhone.

![Swift](../../RESOURCE/005_view.png)

**Draadloos debuggen**

Vanaf iOS 11 en latere versies ondersteunt Xcode draadloos debuggen.

![Swift](../../RESOURCE/005_xcode18.png)

Voorwaarden:

1. De eerste koppeling tussen iPhone en Mac moet met een datakabel worden uitgevoerd
2. De iPhone en Mac moeten zich in hetzelfde Wi-Fi-netwerk bevinden
3. Beide apparaten moeten ontgrendeld blijven

Nadat de eerste koppeling met een kabel is voltooid, kun je later, zelfs als je de kabel verwijdert, direct uitvoeren zolang beide apparaten zich in hetzelfde netwerk bevinden.

Opmerkingen:

* Als het apparaat niet in de apparatenlijst verschijnt, kun je de kabel opnieuw aansluiten
* Wi-Fi-debugging is soms onstabiel; als er een verbindingsfout optreedt, sluit de kabel dan opnieuw aan
* In bedrijfsnetwerken of geïsoleerde netwerkomgevingen kan dit beperkt zijn

## Veelvoorkomende fouten en oplossingen

Wanneer je in Xcode een iPhone verbindt voor debugging, kun je verschillende soorten foutmeldingen tegenkomen. Hieronder staan enkele veelvoorkomende problemen en de bijbehorende oplossingen, zodat je verbindingsproblemen snel kunt lokaliseren en oplossen.

**1. Koppeling niet voltooid**

```swift
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Dit betekent dat de debugkoppeling tussen Xcode en de iPhone nog niet is voltooid.

Oplossing: controleer of je op de iPhone op "Vertrouw" hebt getikt. Als de fout nog steeds verschijnt, start Xcode opnieuw op en verbind opnieuw.

**2. Geen ontwikkelaarsteam geconfigureerd**

```swift
Signing for "SwiftSlimTest" requires a development team.
```

Mogelijk is er geen ontwikkelaarsteam geconfigureerd.

Oplossing: kies in Signing & Capabilities het account waarmee je bent ingelogd.

**3. Developer Disk Image kan niet worden aangekoppeld**

```swift
Previous preparation error: The developer disk image could not be mounted on this device.
```

Dit gebeurt meestal wanneer de installatie tussentijds is onderbroken (bijvoorbeeld door het loskoppelen van de kabel of geforceerd stoppen), waardoor er beperkingen ontstaan bij een nieuwe installatie en deze fout optreedt.

Oplossing: start de iPhone opnieuw op en sluit de kabel opnieuw aan.

**4. Fout bij tunnelverbinding voor debugging**

```swift
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Deze fout wordt vaak veroorzaakt door storing van VPN of netwerkproxy.

Oplossing: schakel VPN of netwerkproxy uit en probeer opnieuw.

**5. Apparaat niet ontgrendeld**

```swift
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Het apparaat staat op het vergrendelscherm; ontgrendel de iPhone.

**6. Apparaat niet geregistreerd**

```swift
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Dit betekent dat dit apparaat nog niet is toegevoegd aan de apparatenlijst van je ontwikkelaarsaccount. Xcode kan er daarom geen geldig provisioning profile voor genereren om de app te ondertekenen en te installeren.

Oplossing: klik op "Register Device" om het apparaat automatisch te registreren.

**7. Deployment-versie komt niet overeen**

```swift
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Dit betekent dat de systeemversie van het apparaat lager is dan de minimale deployment-versie van het project.

Wijzigingspad:

`TARGETS → General → Deployment Info → Deployment Target`

![Swift](../../RESOURCE/005_xcode15.png)

Pas de versie aan zodat deze niet hoger is dan de systeemversie van het apparaat.

Nadat je dit hebt aangepast, maak je de buildmap schoon:

`Product → Clean Build Folder Immediately`

![Swift](../../RESOURCE/005_xcode16.png)

Nadat het opschonen is voltooid, voer je het project opnieuw uit.
