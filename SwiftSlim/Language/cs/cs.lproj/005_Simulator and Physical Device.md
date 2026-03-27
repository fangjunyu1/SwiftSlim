# Simulátor a fyzické zařízení

Dosud jsme dokončili základní konstrukci zobrazení. Hlavním obsahem této lekce je naučit se, jak spouštět aplikaci v simulátoru a na fyzickém zařízení (`Physical Device`).

Ještě si pamatuji, jak jsem měl obrovskou radost, když jsem poprvé nainstaloval aplikaci do iPhonu, protože jsem mohl mnohem názorněji vidět výsledky své práce. Je to druh pozitivní zpětné vazby. Když můžeme používat aplikaci, kterou jsme sami vytvořili, zájem nás přirozeně vede k tomu, abychom se učili další věci.

Teď prosím otevřete projekt osobního životopisu dokončený v minulé lekci a připravte se na spuštění v simulátoru a na fyzickém zařízení.

## Simulátor

Xcode má vestavěno více simulátorů, které pokrývají různé modely iPhonů, iPadů i Apple Watch. Simulátor umožňuje ověřit rozdíly v rozvržení aplikace na různých modelech nebo verzích systému.

### Výběr simulátoru

V seznamu zařízení v horní liště Xcode vyberte simulátor, například `iPhone 16`.

![Swift](../../RESOURCE/005_xcode.png)

### Spuštění simulátoru

Poté klikněte vlevo nahoře na tlačítko spuštění.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode automaticky sestaví projekt a spustí simulátor.

![Swift](../../RESOURCE/005_xcode2.png)

### Zavření simulátoru

Pokud potřebujete simulátor zavřít, klikněte na tlačítko stop v nástrojové liště Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Simulátor lze také zavřít přímo:

![Swift](../../RESOURCE/005_xcode17.png)

Pokud simulátor zavřete přímo, Xcode může zobrazit:

```
Thread 1: signal SIGTERM
```

Obvykle to není logická chyba programu, ale znamená to, že ladicí proces byl ukončen z vnějšku. Většinou je možné to ignorovat a nejde o chybu logiky aplikace.

Ve srovnání s náhledem v Xcode je simulátor blíže reálnému běhovému prostředí. Stále však nejde o plné prostředí skutečného zařízení. Je vhodný pro ověřování rozvržení a testování přizpůsobení pro více modelů.

## O prioritě testovacích prostředí

V reálném vývojovém procesu by se mělo dodržovat následující pořadí testování:

Fyzické zařízení > simulátor > Xcode Preview

Náhled je vhodný pro rychlou úpravu UI; simulátor je vhodný pro strukturální testování; konečné ověření musí proběhnout na fyzickém zařízení, zejména pokud jde o operace související s iCloudem.

## Fyzické zařízení

Jak Xcode Preview, tak simulátor mohou zobrazovat nepřesnosti, proto má fyzické zařízení rozhodující význam. Chování jako systémová oprávnění, výkon nebo mechanismus notifikací lze plně ověřit jen na skutečném zařízení.

### Zapnutí režimu vývojáře

Na iPhonu:

Nastavení → Soukromí a zabezpečení → Režim vývojáře → Zapnout

![Swift](../../RESOURCE/005_xcode4.png)

Systém zařízení vynutí restart. Pokud režim vývojáře není zapnutý, nebude možné aplikaci ladit a spouštět.

### Nastavení vývojářského týmu

Xcode musí mít nastavený vývojářský tým, jinak nebude možné aplikaci podepsat a nainstalovat.

Postup nastavení:

Název projektu → TARGETS → Signing & Capabilities → Team

Pokud se zobrazuje `Add Account...`, znamená to, že zatím nebyl přidán účet Apple.

![Swift](../../RESOURCE/005_xcode5.png)

Klikněte na tlačítko přidání a přihlaste se pomocí Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Po přihlášení pomocí Apple ID vyberte odpovídající účet a dokončete konfiguraci vývojářského týmu.

![Swift](../../RESOURCE/005_xcode7.png)

### Připojení zařízení

Připojte iPhone a Mac pomocí kabelu.

Při prvním připojení:

- Mac se zeptá, zda chcete iPhone připojit k tomuto Macu
- iPhone se zeptá, zda tomuto počítači důvěřujete

Na iPhonu musíte kliknout na „Důvěřovat“ a zadat kód zámku obrazovky. Poté v seznamu zařízení v Xcode vyberte svůj iPhone.

![Swift](../../RESOURCE/005_xcode9.png)

Klikněte vlevo nahoře na tlačítko spuštění.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode sestaví projekt a nainstaluje aplikaci do iPhonu.

![Swift](../../RESOURCE/005_view.png)

**Bezdrátové ladění**

Od iOS 11 a novějších verzí Xcode podporuje bezdrátové ladění.

![Swift](../../RESOURCE/005_xcode18.png)

Podmínky:

1. První spárování iPhonu a Macu musí proběhnout pomocí datového kabelu
2. iPhone a Mac musí být ve stejné Wi-Fi síti
3. Obě zařízení musí být odemčená

Po prvním spárování pomocí kabelu lze aplikaci později spouštět i bez něj, pokud jsou zařízení ve stejné síti.

Na co si dát pozor:

- Pokud se zařízení neobjeví v seznamu zařízení, můžete zkusit znovu připojit kabel
- Ladění přes Wi-Fi bývá občas nestabilní, při problémech s připojením většinou pomůže kabel znovu zapojit
- Ve firemní síti nebo v izolovaném síťovém prostředí může být tato funkce omezená

## Časté chyby a řešení

Při připojování iPhonu k Xcode pro ladění se můžete setkat s různými typy chybových hlášení. Níže uvádíme několik častých problémů a odpovídajících řešení, která mohou pomoci rychle najít a odstranit problémy s připojením.

**1. Párování není dokončeno**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

To znamená, že ladicí párování mezi Xcode a iPhonem ještě nebylo dokončeno.

Řešení: Ověřte, že jste na iPhonu klikli na „Důvěřovat“. Pokud chyba přetrvává, restartujte Xcode a připojte zařízení znovu.

**2. Není nakonfigurován vývojářský tým**

```
Signing for "SwiftSlimTest" requires a development team.
```

Příčinou může být chybějící nastavení vývojářského týmu.

Řešení: V části `Signing & Capabilities` vyberte přihlášený účet.

**3. Nelze připojit Developer Disk Image**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

To se obvykle stává, když je proces instalace přerušen, například vytažením kabelu nebo násilným zastavením, což následně způsobí omezení a chybu při nové instalaci.

Řešení: Restartujte iPhone a znovu jej připojte kabelem.

**4. Selhání připojení ladicího tunelu**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Tato chyba je často způsobena VPN nebo síťovým proxy.

Řešení: Vypněte VPN nebo proxy a zkuste to znovu.

**5. Zařízení je zamčené**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Zařízení je zamčené. Stačí iPhone odemknout.

**6. Zařízení není registrované**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

To znamená, že zařízení nebylo přidáno do seznamu zařízení ve vývojářském účtu, takže pro něj Xcode nemůže vytvořit platný provisioning profil pro podepsání a instalaci aplikace.

Řešení: Klikněte na `Register Device` a zařízení se automaticky zaregistruje.

**7. Neshoda verze deployment target**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

To znamená, že verze systému zařízení je nižší než minimální deployment target projektu.

Cesta ke změně:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Upravte verzi tak, aby nebyla vyšší než verze systému zařízení.

Po úpravě vyčistěte build složku:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Po dokončení vyčištění projekt spusťte znovu.
