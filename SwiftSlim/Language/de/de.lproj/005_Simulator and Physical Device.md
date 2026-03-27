# Simulator und physisches Gerät

Bis hierhin haben wir bereits grundlegende Views aufgebaut. Das Hauptthema dieser Lektion ist, wie man eine App im Simulator und auf einem physischen Gerät ausführt.

Ich erinnere mich noch gut daran, wie ich zum ersten Mal eine App auf meinem iPhone installiert habe. Ich war sehr glücklich, weil ich mein Entwicklungsergebnis direkt auf dem Gerät sehen konnte. Das ist eine Form von positivem Feedback. Wenn wir unsere selbst entwickelte App wirklich benutzen können, motiviert uns das Interesse ganz von selbst dazu, noch mehr zu lernen.

Bitte öffne nun das in der letzten Lektion fertiggestellte Lebenslauf-Projekt und bereite dich darauf vor, es im Simulator und auf einem physischen Gerät auszuführen.

## Simulator

Xcode enthält verschiedene Simulatoren für unterschiedliche Modelle von iPhone, iPad und Apple Watch. Mit dem Simulator kann man Unterschiede im Oberflächenlayout auf verschiedenen Geräten und Systemversionen überprüfen.

### Simulator auswählen

Wähle in der Geräteliste oben in der Xcode-Symbolleiste einen Simulator aus, zum Beispiel iPhone 16.

![Swift](../../RESOURCE/005_xcode.png)

### Simulator starten

Klicke danach links oben auf die Ausführen-Schaltfläche.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode baut das Projekt automatisch und startet den Simulator.

![Swift](../../RESOURCE/005_xcode2.png)

### Simulator beenden

Wenn du den Simulator anhalten möchtest, klicke in der Xcode-Symbolleiste auf die Stopp-Schaltfläche.

![Swift](../../RESOURCE/005_xcode3.png)

Du kannst den Simulator auch direkt schließen:

![Swift](../../RESOURCE/005_xcode17.png)

Wenn du den Simulator direkt schließt, kann Xcode folgende Meldung anzeigen:

```text
Thread 1: signal SIGTERM
```

Das ist normalerweise kein Fehler in der Programmlogik, sondern bedeutet lediglich, dass der Debug-Prozess von außen beendet wurde. In der Regel kann diese Meldung ignoriert werden und gehört nicht zu den eigentlichen App-Logikfehlern.

Im Vergleich zur Xcode-Vorschau kommt der Simulator der realen Laufzeitumgebung deutlich näher. Trotzdem ist er noch kein vollständiges Geräteumfeld. Er eignet sich gut zur Layoutprüfung und für Anpassungstests auf verschiedenen Gerätemodellen.

## Zur Priorität von Testumgebungen

Im realen Entwicklungsablauf sollte man in der folgenden Reihenfolge testen:

Physisches Gerät > Simulator > Xcode-Vorschau

Die Vorschau eignet sich für schnelles UI-Feintuning, der Simulator für strukturelle Tests, und die endgültige Überprüfung muss auf einem physischen Gerät erfolgen, besonders bei iCloud-bezogenen Funktionen.

## Physisches Gerät

Sowohl die Xcode-Vorschau als auch der Simulator können ungenau sein. Deshalb ist das physische Gerät entscheidend. Systemberechtigungen, Leistung, Benachrichtigungsmechanismen und ähnliche Dinge lassen sich nur auf einem echten Gerät vollständig überprüfen.

### Entwicklermodus aktivieren

Auf dem iPhone:

Einstellungen → Datenschutz und Sicherheit → Entwicklermodus → Aktivieren

![Swift](../../RESOURCE/005_xcode4.png)

Das System startet das Gerät danach zwangsweise neu. Ohne aktivierten Entwicklermodus ist Debugging und Ausführen nicht möglich.

### Entwicklerteam konfigurieren

Xcode muss mit einem Entwicklerteam konfiguriert sein, sonst kann die App nicht signiert und installiert werden.

Pfad:

Projektname → TARGETS → Signing & Capabilities → Team

Wenn dort "Add Account..." angezeigt wird, bedeutet das, dass noch kein Apple-Konto hinzugefügt wurde.

![Swift](../../RESOURCE/005_xcode5.png)

Klicke auf die Hinzufügen-Schaltfläche und melde dich mit deiner Apple-ID an.

![Swift](../../RESOURCE/005_xcode6.png)

Nachdem du dich angemeldet hast, wähle das entsprechende Konto aus, um die Entwicklerteam-Konfiguration abzuschließen.

![Swift](../../RESOURCE/005_xcode7.png)

### Gerät verbinden

Verbinde dein iPhone per Kabel mit dem Mac.

Beim ersten Verbinden:

- Der Mac fragt, ob das iPhone mit diesem Mac verbunden werden darf
- Das iPhone fragt, ob diesem Computer vertraut werden soll

Du musst auf dem iPhone unbedingt auf "Vertrauen" tippen und anschließend den Sperrcode eingeben. Danach wählst du in der Xcode-Geräteliste dein iPhone aus.

![Swift](../../RESOURCE/005_xcode9.png)

Klicke anschließend links oben auf die Ausführen-Schaltfläche.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode baut das Projekt und installiert die App auf dem iPhone.

![Swift](../../RESOURCE/005_view.png)

**Kabelloses Debugging**

Ab iOS 11 unterstützt Xcode kabelloses Debugging.

![Swift](../../RESOURCE/005_xcode18.png)

Voraussetzungen:

1. iPhone und Mac müssen beim ersten Mal per Datenkabel gekoppelt werden
2. iPhone und Mac müssen sich im selben WLAN befinden
3. Beide Geräte müssen entsperrt bleiben

Sobald die erste Kopplung per Kabel abgeschlossen ist, kannst du das Kabel später abziehen und die App weiterhin direkt ausführen, solange beide Geräte im selben Netzwerk sind.

Wichtige Hinweise:

- Wenn das Gerät nicht in der Geräteliste erscheint, stecke das Kabel erneut ein
- WLAN-Debugging ist gelegentlich instabil; wenn die Verbindung Probleme macht, hilft oft erneutes Anstecken
- In Firmennetzwerken oder isolierten Netzwerken kann diese Funktion eingeschränkt sein

## Häufige Fehler und Lösungen

Wenn Xcode beim Verbinden mit dem iPhone zum Debuggen verwendet wird, können verschiedene Fehlermeldungen auftreten. Im Folgenden sind einige typische Probleme und passende Lösungen aufgeführt, damit sich Verbindungsfehler schneller lokalisieren und beheben lassen.

**1. Kopplung nicht abgeschlossen**

```text
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Das bedeutet, dass die Debug-Kopplung zwischen Xcode und iPhone noch nicht abgeschlossen ist.

Lösung: Prüfe, ob auf dem iPhone "Vertrauen" bestätigt wurde. Wenn der Fehler weiterhin besteht, starte Xcode neu und verbinde das Gerät erneut.

**2. Entwicklerteam nicht konfiguriert**

```text
Signing for "SwiftSlimTest" requires a development team.
```

Möglicherweise wurde noch kein Entwicklerteam konfiguriert.

Lösung: Wähle in `Signing & Capabilities` ein bereits angemeldetes Konto aus.

**3. Developer Disk Image kann nicht gemountet werden**

```text
Previous preparation error: The developer disk image could not be mounted on this device.
```

Das tritt oft auf, wenn die Installation unterbrochen wurde, zum Beispiel durch das Abziehen des Kabels oder durch erzwungenes Stoppen. Danach kann es beim erneuten Installieren zu Einschränkungen und Fehlern kommen.

Lösung: Starte das iPhone neu und verbinde es anschließend erneut per Kabel.

**4. Fehler bei der Tunnelverbindung**

```text
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Dieser Fehler tritt häufig auf, wenn VPN oder Netzwerk-Proxy die Verbindung stören.

Lösung: Deaktiviere VPN oder Netzwerk-Proxy und versuche es erneut.

**5. Gerät ist gesperrt**

```text
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

Das Gerät befindet sich im Sperrbildschirm. Entsperre einfach das iPhone.

**6. Gerät ist nicht registriert**

```text
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Das bedeutet, dass dieses Gerät noch nicht in der Geräteliste des Entwicklerkontos enthalten ist. Xcode kann deshalb kein gültiges Provisioning-Profil für die Signierung und Installation der App erstellen.

Lösung: Klicke auf "Register Device", um das Gerät automatisch zu registrieren.

**7. Deployment-Version passt nicht**

```text
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Das bedeutet, dass die Systemversion des Geräts niedriger ist als die minimale Deployment-Version des Projekts.

Pfad zum Ändern:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Passe die Version so an, dass sie nicht höher ist als die Systemversion des Geräts.

Danach bereinige den Build-Ordner:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Nach dem Bereinigen führst du das Projekt erneut aus.
