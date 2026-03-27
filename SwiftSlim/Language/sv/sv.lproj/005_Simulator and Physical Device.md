# Simulator och fysisk enhet

Hittills har vi slutfört byggandet av de grundläggande vyerna. Huvudinnehållet i denna lektion är att lära sig hur man kör en app i simulatorn och på en fysisk enhet (Physical Device).

Jag minns fortfarande hur glad jag var första gången jag installerade en app på min iPhone, eftersom jag då kunde se mitt utvecklingsresultat på ett mer direkt sätt. Det är en form av positiv återkoppling. När vi faktiskt kan använda en app som vi själva har utvecklat, driver intresset oss att frivilligt lära oss mer.

Öppna nu CV-projektet som vi slutförde i förra lektionen och förbered dig på att köra det i simulatorn och på en fysisk enhet.

## Simulator

Xcode har flera inbyggda simulatorer som täcker olika modeller av iPhone, iPad och Apple Watch. Simulatorn kan användas för att kontrollera skillnader i gränssnittslayout mellan olika modeller eller systemversioner.

### Välj simulator

I enhetslistan i verktygsfältet högst upp i Xcode väljer du en simulator, till exempel iPhone 16.

![Swift](../../RESOURCE/005_xcode.png)

### Köra simulatorn

Klicka sedan på körknappen uppe till vänster.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode kommer automatiskt att bygga projektet och starta simulatorn.

![Swift](../../RESOURCE/005_xcode2.png)

### Stänga simulatorn

Om du behöver stänga simulatorn kan du klicka på stoppknappen i Xcodes verktygsfält.

![Swift](../../RESOURCE/005_xcode3.png)

Du kan också stänga simulatorn direkt:

![Swift](../../RESOURCE/005_xcode17.png)

Om du stänger simulatorn direkt kan Xcode visa följande meddelande:

``` id="nm8f6q"
Thread 1: signal SIGTERM
````

Detta är vanligtvis inte ett logiskt fel i programmet, utan beror på att felsökningsprocessen avslutades externt. Det kan normalt ignoreras och räknas inte som ett fel i appens logik.

Jämfört med Xcodes förhandsvisning ligger simulatorn närmare den verkliga körmiljön. Men den är fortfarande inte en fullständig enhetsmiljö. Den lämpar sig för layoutverifiering och tester av anpassning till flera enheter.

## Om prioritet mellan testmiljöer

I ett verkligt utvecklingsflöde bör testordningen vara följande:

fysisk enhet > simulator > Xcode-förhandsvisning

Förhandsvisningen passar för snabb justering av UI. Simulatorn passar för strukturella tester. Den slutliga verifieringen måste göras på en fysisk enhet, särskilt för iCloud-relaterade funktioner.

## Fysisk enhet

Både Xcodes förhandsvisning och simulatorn kan visa innehåll på ett mindre exakt sätt, därför är den fysiska enheten avgörande. Systembehörigheter, prestanda, notismekanismer och liknande beteenden kan bara verifieras fullt ut på en riktig enhet.

### Aktivera utvecklarläge

På iPhone:

Inställningar → Integritet och säkerhet → Utvecklarläge → Aktivera

![Swift](../../RESOURCE/005_xcode4.png)

Systemet kommer att tvinga fram en omstart av enheten. Om utvecklarläget inte är aktiverat går det inte att köra felsökning.

### Konfigurera utvecklarteam

Xcode måste ha ett utvecklarteam konfigurerat, annars kan appen inte signeras och installeras.

Konfigurationsväg:

projektnamn → TARGETS → Signing & Capabilities → Team

Om "Add Account..." visas betyder det att inget Apple-konto ännu har lagts till.

![Swift](../../RESOURCE/005_xcode5.png)

Klicka på lägg till-knappen och logga in med ditt Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

När du har loggat in med Apple ID väljer du motsvarande konto för att slutföra konfigurationen av utvecklarteamet.

![Swift](../../RESOURCE/005_xcode7.png)

### Anslut enheten

Anslut iPhone till Mac med en kabel.

Vid första anslutningen:

* Mac visar en fråga om iPhone ska anslutas till denna Mac
* iPhone frågar om du litar på datorn.

Du måste trycka på "Lita på" på iPhone och ange låsskärmskoden. Välj därefter din iPhone i Xcodes enhetslista.

![Swift](../../RESOURCE/005_xcode9.png)

Klicka på körknappen uppe till vänster.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode bygger projektet och installerar appen på iPhone.

![Swift](../../RESOURCE/005_view.png)

**Trådlös felsökning**

I iOS 11 och senare stöder Xcode trådlös felsökning.

![Swift](../../RESOURCE/005_xcode18.png)

Förutsättningar:

1. iPhone och Mac måste första gången paras ihop med datakabel
2. iPhone och Mac måste vara anslutna till samma Wi-Fi-nätverk
3. båda enheterna måste hållas upplåsta

När den första parkopplingen har slutförts med kabel kan du därefter, även om kabeln kopplas ur, köra direkt så länge båda enheterna är på samma nätverk.

Observera:

* Om enheten inte visas i enhetslistan kan du koppla in kabeln igen
* Wi-Fi-felsökning kan ibland vara instabil, och om anslutningen blir onormal räcker det ofta att ansluta kabeln igen
* I företagsnätverk eller isolerade nätverk kan funktionen vara begränsad

## Vanliga fel och lösningar

När du ansluter iPhone till Xcode för felsökning kan olika typer av felmeddelanden uppstå. Nedan listas några vanliga problem och motsvarande lösningar som kan hjälpa dig att snabbt lokalisera och lösa anslutningsproblem.

**1. Parkopplingen är inte slutförd**

```id="n8557n"
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Det betyder att felsökningsparkopplingen mellan Xcode och iPhone ännu inte har slutförts.

Lösning: kontrollera att du har tryckt på "Lita på" på iPhone. Om felet fortfarande visas, starta om Xcode och anslut igen.

**2. Inget utvecklarteam är konfigurerat**

```id="g5xjti"
Signing for "SwiftSlimTest" requires a development team.
```

Det kan bero på att inget utvecklarteam har konfigurerats.

Lösning: välj det inloggade kontot i Signing & Capabilities.

**3. Developer Disk Image kan inte monteras**

```id="lqsluk"
Previous preparation error: The developer disk image could not be mounted on this device.
```

Detta inträffar ofta när installationsprocessen avbryts, till exempel om kabeln dras ur eller körningen tvångsstoppas, vilket leder till begränsningar vid nästa installation och därmed fel.

Lösning: starta om iPhone och anslut kabeln igen.

**4. Anslutningen till felsökningstunneln misslyckades**

```id="zrke85"
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Detta fel orsakas ofta av VPN eller nätverksproxy.

Lösning: stäng av VPN eller nätverksproxy och försök igen.

**5. Enheten är inte upplåst**

```id="g9dg4g"
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Enheten är låst. Lås upp iPhone så räcker det.

**6. Enheten är inte registrerad**

```id="nt2j7t"
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Det betyder att enheten inte har lagts till i utvecklarkontots enhetslista, och därför kan Xcode inte skapa en giltig provisioningprofil för att signera och installera appen.

Lösning: klicka på "Register Device" för automatisk registrering.

**7. Versionskonflikt vid distribution**

```id="hsmtsz"
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Det betyder att enhetens systemversion är lägre än projektets lägsta distributionsversion.

Ändringsväg:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Justera versionen så att den inte är högre än enhetens systemversion.

Efter ändringen, rensa build-mappen:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

När rensningen är klar, kör igen.
