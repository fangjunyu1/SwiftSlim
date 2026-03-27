# ಸಿಮ್ಯುಲೇಟರ್ ಮತ್ತು ನೈಜ ಸಾಧನ

ಇಲ್ಲಿಯವರೆಗೆ ನಾವು ಮೂಲಭೂತ view ನಿರ್ಮಾಣವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೇವೆ. ಈ ಪಾಠದ ಮುಖ್ಯ ವಿಷಯವೆಂದರೆ App ಅನ್ನು simulator ಹಾಗೂ physical device ಎರಡರಲ್ಲೂ ಹೇಗೆ ಚಾಲನೆ ಮಾಡುವುದು ಎಂಬುದನ್ನು ಕಲಿಯುವುದು.

ಮೊದಲ ಬಾರಿ App ಅನ್ನು iPhone ಗೆ ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿದಾಗ ನನಗೆ ತುಂಬಾ ಸಂತೋಷವಾಗಿತ್ತು, ಏಕೆಂದರೆ ನನ್ನ ಅಭಿವೃದ್ಧಿ ಫಲಿತಾಂಶವನ್ನು ಇನ್ನಷ್ಟು ನೇರವಾಗಿ ನೋಡಬಹುದಾಗಿತ್ತು. ಇದು ಒಂದು ಸಕಾರಾತ್ಮಕ ಪ್ರತಿಕ್ರಿಯೆ — ನಾವು ಸ್ವತಃ ನಿರ್ಮಿಸಿದ App ಅನ್ನು ಬಳಸಿದಾಗ, ಆಸಕ್ತಿಯೇ ನಮ್ಮನ್ನು ಇನ್ನಷ್ಟು ಕಲಿಯಲು ಪ್ರೇರೇಪಿಸುತ್ತದೆ.

ಈಗ, ಹಿಂದಿನ ಪಾಠದಲ್ಲಿ ನಿರ್ಮಿಸಿದ ವೈಯಕ್ತಿಕ ರೆಸ್ಯೂಮ್ ಪ್ರಾಜೆಕ್ಟ್ ತೆರೆಯಿರಿ, ಮತ್ತು simulator ಹಾಗೂ physical device ನಲ್ಲಿ ಅದನ್ನು ಚಾಲನೆ ಮಾಡಲು ಸಿದ್ಧರಾಗಿ.

## ಸಿಮ್ಯುಲೇಟರ್

Xcode ಯಲ್ಲೇ ಅನೇಕ simulator ಗಳು ಒಳನಿರ್ಮಿತವಾಗಿವೆ; ಇವು ವಿಭಿನ್ನ iPhone, iPad ಹಾಗೂ Apple Watch ಮಾದರಿಗಳನ್ನು ಒಳಗೊಂಡಿವೆ. Simulator ಮೂಲಕ App ಬೇರೆ ಬೇರೆ ಮಾದರಿ ಅಥವಾ ಸಿಸ್ಟಮ್ ಆವೃತ್ತಿಗಳಲ್ಲಿ ಹೇಗೆ ಕಾಣುತ್ತದೆ ಎಂಬುದನ್ನು ಪರೀಕ್ಷಿಸಬಹುದು.

### ಸಿಮ್ಯುಲೇಟರ್ ಆಯ್ಕೆ

Xcode ಮೇಲ್ಭಾಗದ toolbar ನ device list ನಲ್ಲಿ ಒಂದು simulator ಆಯ್ಕೆಮಾಡಿ (ಉದಾಹರಣೆಗೆ iPhone 16).

![Swift](../../RESOURCE/005_xcode.png)

### ಸಿಮ್ಯುಲೇಟರ್ ಚಾಲನೆ

ನಂತರ ಎಡ ಮೇಲ್ಭಾಗದ run ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿ.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ build ಮಾಡಿ simulator ಅನ್ನು ಚಾಲನೆಗೊಳಿಸುತ್ತದೆ.

![Swift](../../RESOURCE/005_xcode2.png)

### ಸಿಮ್ಯುಲೇಟರ್ ಮುಚ್ಚುವುದು

Simulator ಮುಚ್ಚಬೇಕಾದರೆ, Xcode toolbar ನಲ್ಲಿ ಇರುವ stop ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿ.

![Swift](../../RESOURCE/005_xcode3.png)

ಅಥವಾ simulator ನ್ನೇ ನೇರವಾಗಿ ಮುಚ್ಚಬಹುದು:

![Swift](../../RESOURCE/005_xcode17.png)

Simulator ನ್ನು ನೇರವಾಗಿ ಮುಚ್ಚಿದರೆ, Xcode ಈ ತರಹದ ಸಂದೇಶ ತೋರಿಸಬಹುದು:

```
Thread 1: signal SIGTERM
```

ಇದು ಸಾಮಾನ್ಯವಾಗಿ ಪ್ರೋಗ್ರಾಂ ಲಾಜಿಕ್ ದೋಷವಲ್ಲ; debugging process ಹೊರಗಿನಿಂದ terminate ಆಗಿರುವುದರಿಂದ ಇದು ಬರುತ್ತದೆ. ಸಾಮಾನ್ಯವಾಗಿ ಇದನ್ನು ಗಮನಿಸದೇ ಇರಬಹುದು, ಇದು app ಲಾಜಿಕ್ ದೋಷವಲ್ಲ.

Xcode preview ಗಿಂತ simulator ನೈಜ ಚಾಲನಾ ಪರಿಸರಕ್ಕೆ ಹೆಚ್ಚು ಸಮೀಪದಲ್ಲಿದೆ. ಆದರೆ ಅದು ಇನ್ನೂ ಸಂಪೂರ್ಣ ಸಾಧನ ಪರಿಸರವಲ್ಲ. ಇದು layout ಪರಿಶೀಲನೆ ಮತ್ತು ವಿವಿಧ ಸಾಧನಗಳಿಗೆ ಹೊಂದಾಣಿಕೆ ಪರೀಕ್ಷೆಗೆ ಸೂಕ್ತ.

## ಪರೀಕ್ಷಾ ಪರಿಸರಗಳ ಆದ್ಯತೆ ಬಗ್ಗೆ

ನೈಜ ಅಭಿವೃದ್ಧಿ ಪ್ರಕ್ರಿಯೆಯಲ್ಲಿ ಪರೀಕ್ಷೆಯ ಕ್ರಮ ಹೀಗಿರಬೇಕು:

ನೈಜ ಸಾಧನ > simulator > Xcode preview

Preview ಯು ವೇಗವಾಗಿ UI ಸರಿಪಡಿಸಲು ಸೂಕ್ತ; simulator ರಚನಾತ್ಮಕ ಪರೀಕ್ಷೆಗಳಿಗೆ ಸೂಕ್ತ; ಅಂತಿಮ ಪರಿಶೀಲನೆ ಕಡ್ಡಾಯವಾಗಿ physical device ಮೇಲೆ ಮಾಡಬೇಕು, ವಿಶೇಷವಾಗಿ iCloud ಸಂಬಂಧಿತ ಕಾರ್ಯಗಳಿಗೆ.

## ನೈಜ ಸಾಧನ

Xcode preview ಹಾಗು simulator ಎರಡರಲ್ಲೂ ಕೆಲವು ಪ್ರದರ್ಶನ ವ್ಯತ್ಯಾಸಗಳಿರಬಹುದು; ಆದ್ದರಿಂದ physical device ಅತ್ಯಂತ ನಿರ್ಣಾಯಕ. System permissions, performance, notifications ಮುಂತಾದ ಹಲವು ವರ್ತನೆಗಳನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಪರಿಶೀಲಿಸಲು physical device ಅಗತ್ಯ.

### Developer Mode ತೆರೆಯುವುದು

iPhone ನಲ್ಲಿ:

Settings → Privacy & Security → Developer Mode → Enable

![Swift](../../RESOURCE/005_xcode4.png)

ಸಿಸ್ಟಮ್ ಸಾಧನವನ್ನು ಬಲವಂತವಾಗಿ ಮರುಪ್ರಾರಂಭಿಸುತ್ತದೆ. Developer Mode ತೆರೆಯದಿದ್ದರೆ debug run ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ.

### Developer team ಸಂರಚನೆ

Xcode ನಲ್ಲಿ developer team configuration ಅಗತ್ಯ. ಇಲ್ಲದಿದ್ದರೆ app ಅನ್ನು sign ಮಾಡಲಾಗುವುದಿಲ್ಲ ಮತ್ತು install ಮಾಡಲಾಗುವುದಿಲ್ಲ.

ಹಾದಿ:

Project Name → TARGETS → Signing & Capabilities → Team

ಅಲ್ಲಿ `"Add Account..."` ತೋರುತ್ತಿದ್ದರೆ, ಇನ್ನೂ Apple account ಸೇರಿಸಿಲ್ಲ ಎಂದರ್ಥ.

![Swift](../../RESOURCE/005_xcode5.png)

Add ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿ, Apple ID ಬಳಸಿ sign in ಮಾಡಿ.

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID ಗೆ login ಆದ ನಂತರ, ಸರಿಯಾದ account ಆಯ್ಕೆಮಾಡಿ developer team configuration ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿ.

![Swift](../../RESOURCE/005_xcode7.png)

### ಸಾಧನ ಸಂಪರ್ಕ

ಕೇಬಲ್ ಬಳಸಿ iPhone ಮತ್ತು Mac ಅನ್ನು ಸಂಪರ್ಕಿಸಿ.

ಮೊದಲ ಸಂಪರ್ಕ ಸಮಯದಲ್ಲಿ:

- Mac ನಲ್ಲಿ iPhone ಅನ್ನು ಈ Mac ಗೆ ಸಂಪರ್ಕಿಸುವುದೇ ಎಂದು ಕೇಳಬಹುದು
- iPhone ನಲ್ಲಿ ಈ ಕಂಪ್ಯೂಟರ್ ಅನ್ನು trust ಮಾಡಬೇಕೇ ಎಂದು ಕೇಳಬಹುದು

ಕಡ್ಡಾಯವಾಗಿ iPhone ನಲ್ಲಿ “Trust” ಒತ್ತಿ, ನಂತರ lock-screen password ನಮೂದಿಸಬೇಕು. ನಂತರ Xcode device list ನಲ್ಲಿ ನಿಮ್ಮ iPhone ಆಯ್ಕೆಮಾಡಿ.

![Swift](../../RESOURCE/005_xcode9.png)

ಎಡ ಮೇಲ್ಭಾಗದ run ಬಟನ್ ಕ್ಲಿಕ್ ಮಾಡಿ.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು build ಮಾಡಿ App ಅನ್ನು iPhone ಗೆ install ಮಾಡುತ್ತದೆ.

![Swift](../../RESOURCE/005_view.png)

**ವೈರ್‌ಲೆಸ್ ಡೀಬಗ್ಗಿಂಗ್**

iOS 11 ಮತ್ತು ನಂತರದ ಆವೃತ್ತಿಗಳಲ್ಲಿ Xcode ವೈರ್‌ಲೆಸ್ debugging ಗೆ ಬೆಂಬಲ ನೀಡುತ್ತದೆ.

![Swift](../../RESOURCE/005_xcode18.png)

ಪೂರ್ವಶರತ್ತುಗಳು:

1. iPhone ಮತ್ತು Mac ಮೊದಲು ಕಡ್ಡಾಯವಾಗಿ ಕೇಬಲ್ ಮೂಲಕ pair ಆಗಿರಬೇಕು
2. iPhone ಮತ್ತು Mac ಒಂದೇ Wi-Fi ನೆಟ್‌ವರ್ಕ್‌ನಲ್ಲಿ ಇರಬೇಕು
3. ಎರಡೂ ಸಾಧನಗಳೂ unlock ಆಗಿರಬೇಕು

ಮೊದಲ ಸಲ data cable ಮೂಲಕ pairing ಪೂರ್ಣಗೊಂಡ ನಂತರ, ಮುಂದೆ ಕೇಬಲ್ ತೆಗೆದರೂ, ಒಂದೇ ನೆಟ್‌ವರ್ಕ್‌ನಲ್ಲಿದ್ದರೆ ನೇರವಾಗಿ run ಮಾಡಬಹುದು.

ಗಮನಿಸಬೇಕಾದ ವಿಷಯಗಳು:

- ಸಾಧನ device list ನಲ್ಲಿ ಕಾಣಿಸದಿದ್ದರೆ, data cable ಮರುಸೇರಿಸಿ
- Wi-Fi debugging ಕೆಲವೊಮ್ಮೆ ಸ್ಥಿರವಾಗಿರದೆ ಇರಬಹುದು; ಸಂಪರ್ಕದ ಸಮಸ್ಯೆ ಬಂದರೆ ಮತ್ತೆ ಕೇಬಲ್ ಜೋಡಿಸಿ
- ಕಂಪನಿ ನೆಟ್‌ವರ್ಕ್ ಅಥವಾ isolation network ಗಳಲ್ಲಿ ಈ ಸಂಪರ್ಕವನ್ನು ನಿರ್ಬಂಧಿಸಬಹುದು

## ಸಾಮಾನ್ಯ ದೋಷಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು

Xcode ಮೂಲಕ iPhone debug ಮಾಡುವಾಗ, ಹಲವು ಬಗೆಯ error messages ಬರಬಹುದು. ಕೆಳಗೆ ಕೆಲವು ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಅವಕ್ಕೆ ಹೊಂದುವ ಪರಿಹಾರಗಳನ್ನು ನೀಡಲಾಗಿದೆ, ಅವು ಸಂಪರ್ಕದ ದೋಷಗಳನ್ನು ವೇಗವಾಗಿ ಗುರುತಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತವೆ.

**1. Pairing ಪೂರ್ಣಗೊಂಡಿಲ್ಲ**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

ಇದು Xcode ಮತ್ತು iPhone ನಡುವಿನ debug pairing ಇನ್ನೂ ಪೂರ್ಣವಾಗಿಲ್ಲ ಎಂದು ಸೂಚಿಸುತ್ತದೆ.

ಪರಿಹಾರ: iPhone ನಲ್ಲಿ “Trust” ಒತ್ತಿದೆಯೇ ಎಂದು ಖಚಿತಪಡಿಸಿ. ಇನ್ನೂ error ಇದ್ದರೆ, Xcode ಮರುಪ್ರಾರಂಭಿಸಿ ಸಾಧನವನ್ನು ಪುನಃ ಸಂಪರ್ಕಿಸಿ.

**2. Developer team configure ಮಾಡಿಲ್ಲ**

```
Signing for "SwiftSlimTest" requires a development team.
```

ಇದು developer team ಸಂರಚಿಸಲಿಲ್ಲ ಎಂಬ ಕಾರಣವಾಗಿರಬಹುದು.

ಪರಿಹಾರ: `Signing & Capabilities` ನಲ್ಲಿ login ಆದ account ಆಯ್ಕೆಮಾಡಿ.

**3. Developer Disk Image mount ಆಗಲಿಲ್ಲ**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

ಇದು ಸಾಮಾನ್ಯವಾಗಿ install ಪ್ರಕ್ರಿಯೆ ಮಧ್ಯೆ ನಿಂತಾಗ (ಉದಾ. ಕೇಬಲ್ ತೆಗೆದಾಗ ಅಥವಾ ಬಲವಂತವಾಗಿ ನಿಲ್ಲಿಸಿದಾಗ) ಉಂಟಾಗುತ್ತದೆ. ಇದರಿಂದ ಮರು-install ಸಮಯದಲ್ಲಿ ನಿರ್ಬಂಧ ಉಂಟಾಗಿ error ಬರುತ್ತದೆ.

ಪರಿಹಾರ: iPhone ಅನ್ನು reboot ಮಾಡಿ, ನಂತರ ಕೇಬಲ್ ಮರುಸಂಪರ್ಕಿಸಿ.

**4. Debug tunnel ಸಂಪರ್ಕ ವಿಫಲವಾಯಿತು**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

ಈ error ಸಾಮಾನ್ಯವಾಗಿ VPN ಅಥವಾ network proxy ಹಸ್ತಕ್ಷೇಪದಿಂದ ಬರುತ್ತದೆ.

ಪರಿಹಾರ: VPN ಅಥವಾ network proxy ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ, ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.

**5. ಸಾಧನ unlock ಆಗಿಲ್ಲ**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

ಸಾಧನ lock ಆಗಿದೆ. iPhone unlock ಮಾಡಿದರೆ ಸಾಕು.

**6. ಸಾಧನ ನೋಂದಾಯಿಸಲ್ಪಟ್ಟಿಲ್ಲ**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

ಇದರಿಂದ ಆ ಸಾಧನ developer account ನ device list ಗೆ ಸೇರಿಸಲಾಗಿಲ್ಲ ಎಂಬುದು ಅರ್ಥ. ಹೀಗಾಗಿ Xcode ಅದಕ್ಕಾಗಿ ಮಾನ್ಯ provisioning profile ಸೃಷ್ಟಿಸಿ app sign ಮಾಡಿ install ಮಾಡಲು ಸಾಧ್ಯವಾಗುವುದಿಲ್ಲ.

ಪರಿಹಾರ: `"Register Device"` ಕ್ಲಿಕ್ ಮಾಡಿದರೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ನೋಂದಾಯಿಸಲಾಗುತ್ತದೆ.

**7. Deployment version ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

ಇದು ಸಾಧನದ ಸಿಸ್ಟಮ್ ಆವೃತ್ತಿ ಪ್ರಾಜೆಕ್ಟ್‌ನ ಕನಿಷ್ಠ deployment version ಗಿಂತ ಕಡಿಮೆ ಇದೆ ಎಂಬುದನ್ನು ಸೂಚಿಸುತ್ತದೆ.

ಬದಲಾವಣೆ ಹಾದಿ:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

ಆ ಆವೃತ್ತಿಯನ್ನು ಸಾಧನದ ಸಿಸ್ಟಮ್ ಆವೃತ್ತಿಗಿಂತ ಹೆಚ್ಚಾಗದಂತೆ ಬದಲಾಯಿಸಿ.

ಬದಲಾವಣೆಯ ನಂತರ build folder ಅನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

ಸ್ವಚ್ಛಗೊಳಿಸಿದ ನಂತರ ಪುನಃ run ಮಾಡಿ.
