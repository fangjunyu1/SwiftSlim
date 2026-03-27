# Simulador i dispositiu físic

Fins a aquest punt ja hem completat la construcció de vistes bàsiques. El contingut principal d'aquesta lliçó és aprendre a executar una app tant al simulador com en un dispositiu físic (`Physical Device`).

Encara recordo la primera vegada que vaig instal·lar una app a l'iPhone: em va fer molta il·lusió, perquè podia veure el resultat del meu desenvolupament d'una manera molt més directa. És una mena de reforç positiu. Quan podem utilitzar una app desenvolupada per nosaltres mateixos, l'interès ens empeny de manera natural a aprendre més coses.

Ara obre el projecte del currículum personal que vam completar a la lliçó anterior i prepara't per executar-lo al simulador i en un dispositiu real.

## Simulador

Xcode incorpora diversos simuladors integrats, que cobreixen diferents models d'iPhone, iPad i Apple Watch. El simulador permet verificar diferències de disposició de la interfície entre diferents models o versions del sistema.

### Seleccionar un simulador

A la llista de dispositius de la barra superior d'Xcode, selecciona un simulador (per exemple, `iPhone 16`).

![Swift](../../RESOURCE/005_xcode.png)

### Executar el simulador

Després fes clic al botó d'execució de la cantonada superior esquerra.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode construirà automàticament el projecte i iniciarà el simulador.

![Swift](../../RESOURCE/005_xcode2.png)

### Tancar el simulador

Si vols tancar el simulador, prem el botó d'aturar de la barra d'eines d'Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

També pots tancar el simulador directament:

![Swift](../../RESOURCE/005_xcode17.png)

Si tanques el simulador directament, Xcode pot mostrar:

```text
Thread 1: signal SIGTERM
```

Això normalment no és un error de lògica del programa, sinó que el procés de depuració ha estat aturat des de fora. En general es pot ignorar, perquè no és un problema de la lògica de l'app.

Comparat amb la previsualització d'Xcode, el simulador és més proper a un entorn d'execució real. Però encara no és un entorn complet de dispositiu. És adequat per verificar la disposició i per a proves d'adaptació a diversos models.

## Sobre la prioritat dels entorns de prova

En un flux de desenvolupament real, s'hauria de seguir aquest ordre de prova:

`Dispositiu físic > Simulador > Previsualització d'Xcode`

La previsualització és adequada per ajustar ràpidament la UI; el simulador és adequat per a proves estructurals; la verificació final s'ha de fer obligatòriament en un dispositiu físic, especialment en operacions relacionades amb iCloud.

## Dispositiu físic

Tant la previsualització d'Xcode com el simulador poden mostrar resultats inexactes, per això el dispositiu físic és decisiu. Permisos del sistema, rendiment, mecanismes de notificació i altres comportaments només es poden validar completament en un dispositiu real.

### Activar el mode de desenvolupador

A l'iPhone:

`Configuració -> Privacitat i seguretat -> Mode de desenvolupador -> Activar`

![Swift](../../RESOURCE/005_xcode4.png)

El sistema reiniciarà el dispositiu de manera forçada. Si no està activat el mode de desenvolupador, no es podrà executar ni depurar l'app.

### Configurar l'equip de desenvolupament

Xcode ha de tenir configurat un equip de desenvolupament; en cas contrari, no podrà signar ni instal·lar l'aplicació.

Ruta de configuració:

`Nom del projecte -> TARGETS -> Signing & Capabilities -> Team`

Si apareix `"Add Account..."`, vol dir que encara no has afegit cap compte d'Apple.

![Swift](../../RESOURCE/005_xcode5.png)

Fes clic al botó per afegir-lo i inicia sessió amb el teu `Apple ID`.

![Swift](../../RESOURCE/005_xcode6.png)

Després d'iniciar sessió, selecciona el compte corresponent per completar la configuració de l'equip de desenvolupament.

![Swift](../../RESOURCE/005_xcode7.png)

### Connectar el dispositiu

Utilitza un cable per connectar l'iPhone al Mac.

La primera vegada que el connectis:

- el Mac et preguntarà si vols connectar l'iPhone a aquest Mac
- l'iPhone et preguntarà si confies en aquest ordinador

Has de prémer `Trust` a l'iPhone i introduir el codi de desbloqueig. Després selecciona el teu iPhone a la llista de dispositius d'Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Fes clic al botó d'execució de la cantonada superior esquerra.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode construirà la app i la instal·larà a l'iPhone.

![Swift](../../RESOURCE/005_view.png)

**Depuració sense fil**

A partir d'iOS 11, Xcode suporta depuració sense fil.

![Swift](../../RESOURCE/005_xcode18.png)

Condicions prèvies:

1. La primera vinculació entre l'iPhone i el Mac s'ha de fer obligatòriament amb cable
2. L'iPhone i el Mac han d'estar a la mateixa xarxa Wi-Fi
3. Tots dos dispositius han de romandre desbloquejats

Després d'haver completat la primera vinculació amb cable, encara que el desconnectis, mentre siguin a la mateixa xarxa es podrà continuar executant directament.

Aspectes a tenir en compte:

- si el dispositiu no apareix a la llista, pots reconnectar el cable
- la depuració per Wi-Fi pot ser inestable de tant en tant; si hi ha errors de connexió, torna a connectar el cable
- en xarxes corporatives o xarxes aïllades aquesta funció pot estar restringida

## Errors habituals i solucions

Quan connectem l'iPhone a Xcode per depurar, ens podem trobar amb diferents tipus de missatges d'error. A continuació es llisten alguns problemes habituals i la manera de resoldre'ls, que poden ajudar a localitzar i solucionar ràpidament anomalies de connexió.

**1. La vinculació no s'ha completat**

```text
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Això significa que la vinculació de depuració entre Xcode i l'iPhone encara no s'ha completat.

Solució: comprova que a l'iPhone s'ha premut `Trust`; si l'error continua, reinicia Xcode i torna a connectar el dispositiu.

**2. No s'ha configurat cap equip de desenvolupament**

```text
Signing for "SwiftSlimTest" requires a development team.
```

És possible que no s'hagi configurat l'equip de desenvolupament.

Solució: a `Signing & Capabilities`, selecciona el compte amb el qual has iniciat sessió.

**3. No s'ha pogut muntar el Developer Disk Image**

```text
Previous preparation error: The developer disk image could not be mounted on this device.
```

Normalment això apareix quan el procés d'instal·lació s'ha interromput (per exemple, desconnectant el cable o aturant l'execució a la força), i això limita la reinstal·lació.

Solució: reinicia l'iPhone i torna a connectar el cable.

**4. Error de connexió del túnel de depuració**

```text
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Aquest error és habitual quan hi ha interferències d'una VPN o d'un proxy de xarxa.

Solució: desactiva la VPN o el proxy i torna-ho a provar.

**5. El dispositiu està bloquejat**

```text
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

El dispositiu està bloquejat. Només cal desbloquejar l'iPhone.

**6. El dispositiu no està registrat**

```text
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Això significa que el dispositiu no ha estat afegit a la llista de dispositius del compte de desenvolupador, i Xcode no pot generar el perfil adequat per signar i instal·lar l'app.

Solució: fes clic a `"Register Device"` perquè es registri automàticament.

**7. La versió de desplegament no coincideix**

```text
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Això indica que la versió del sistema del dispositiu és inferior a la versió mínima de desplegament del projecte.

Ruta de modificació:

`TARGETS -> General -> Deployment Info -> Deployment Target`

![Swift](../../RESOURCE/005_xcode15.png)

Ajusta la versió perquè no sigui superior a la versió del sistema del dispositiu.

Després d'això, neteja la carpeta de compilació:

`Product -> Clean Build Folder Immediately`

![Swift](../../RESOURCE/005_xcode16.png)

Quan la neteja s'hagi completat, torna a executar-ho.
