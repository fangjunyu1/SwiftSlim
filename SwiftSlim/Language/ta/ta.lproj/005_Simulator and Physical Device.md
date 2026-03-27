# சிமுலேட்டர் மற்றும் உண்மையான சாதனம்

இதுவரை, நாங்கள் அடிப்படை view உருவாக்கத்தை முடித்துள்ளோம். இந்தப் பாடத்தின் முக்கிய உள்ளடக்கம், App-ஐ simulator மற்றும் உண்மையான சாதனம் (Physical Device) மீது எவ்வாறு இயக்குவது என்பதை கற்றுக்கொள்வது.

நான் முதல் முறையாக iPhone-இல் App-ஐ நிறுவியதை இன்னும் நினைவில் வைத்திருக்கிறேன். அப்போது நான் மிகவும் மகிழ்ச்சியடைந்தேன், ஏனெனில் என் அபிவிருத்தி விளைவுகளை இன்னும் நேரடியாகக் காண முடிந்தது. இது ஒரு நேர்மறை பின்னூட்டமாகும். நாம் நாமே உருவாக்கிய App-ஐ உண்மையில் பயன்படுத்த முடிந்தால், அந்த ஆர்வம் நம்மை இன்னும் அதிக அறிவை தானாகக் கற்கத் தூண்டும்.

இப்போது, முந்தைய பாடத்தில் முடித்த தனிப்பட்ட சுயவிவரத் திட்டத்தைத் திறந்து, simulator மற்றும் உண்மையான சாதனத்தில் இயக்க தயாராகுங்கள்.

## சிமுலேட்டர்

Xcode-இல் பல்வேறு simulator-கள் உள்ளன. அவை பல iPhone, iPad மற்றும் Apple Watch மாதிரிகளை உள்ளடக்கியவை. simulator மூலம் App வெவ்வேறு சாதன மாதிரிகள் அல்லது பதிப்புகளில் எவ்வாறு layout வேறுபாடுகளைக் காட்டுகிறது என்பதைச் சரிபார்க்கலாம்.

### சிமுலேட்டரைத் தேர்வு செய்தல்

Xcode-இன் மேல் toolbar-இல் இருக்கும் device list-இல் இருந்து ஒரு simulator-ஐத் தேர்வு செய்யுங்கள் (உதாரணமாக iPhone 16).

![Swift](../../RESOURCE/005_xcode.png)

### சிமுலேட்டரை இயக்குதல்

பிறகு, மேல் இடதுபுறத்தில் உள்ள Run பொத்தானை அழுத்துங்கள்.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode தானாகவே project-ஐ build செய்து simulator-ஐத் தொடங்கும்.

![Swift](../../RESOURCE/005_xcode2.png)

### சிமுலேட்டரை மூடுதல்

simulator-ஐ மூட வேண்டுமெனில், Xcode toolbar-இல் உள்ள Stop பொத்தானை அழுத்துங்கள்.

![Swift](../../RESOURCE/005_xcode3.png)

அல்லது simulator-ஐ நேரடியாக மூடவும் முடியும்:

![Swift](../../RESOURCE/005_xcode17.png)

நீங்கள் simulator-ஐ நேரடியாக மூடினால், Xcode கீழே உள்ளபடி ஒரு தகவலைக் காட்டக்கூடும்:

```swift
Thread 1: signal SIGTERM
```

இது பொதுவாக program logic பிழை அல்ல; மாறாக, debug process வெளியிலிருந்து நிறுத்தப்பட்டதால் இப்படியாகக் காட்டப்படும். பொதுவாக இதை புறக்கணிக்கலாம்; இது App-இன் logic பிழை அல்ல.

Xcode preview-யை விட, simulator உண்மையான இயக்க சூழலுக்கு இன்னும் நெருக்கமாகும். ஆனால் இதுவும் முழுமையான device environment அல்ல. இது layout சரிபார்ப்பு மற்றும் பல்வேறு device adaptation test-களுக்கு ஏற்றது.

## சோதனைச் சூழல்களின் முன்னுரிமை

உண்மையான அபிவிருத்தி செயல்முறையில், கீழ்க்கண்ட சோதனை வரிசையைப் பின்பற்ற வேண்டும்:

உண்மையான சாதனம் > சிமுலேட்டர் > Xcode Preview

Preview விரைவான UI திருத்தங்களுக்கு ஏற்றது; simulator கட்டமைப்பு சார்ந்த சோதனைகளுக்கு ஏற்றது; இறுதி சரிபார்ப்பு கட்டாயமாக உண்மையான சாதனத்தில் செய்யப்பட வேண்டும், குறிப்பாக iCloud தொடர்பான செயல்பாடுகளுக்கு.

## உண்மையான சாதனம்

Xcode preview மற்றும் simulator இரண்டிலும் சில சமயங்களில் துல்லியமற்ற காட்சிகள் இருக்கலாம். அதனால், உண்மையான சாதனம் முடிவுசெய்யும் முக்கியத்துவம் பெறுகிறது. system permissions, performance, notification mechanism போன்ற நடத்தைகளை முழுமையாகச் சரிபார்க்க இயல்வது உண்மையான சாதனத்தில் மட்டுமே.

### Developer Mode-ஐ இயக்குதல்

iPhone-இல்:

Settings → Privacy & Security → Developer Mode → Enable

![Swift](../../RESOURCE/005_xcode4.png)

System கட்டாயமாக device-ஐ restart செய்யும். Developer Mode இயக்கப்படாமல் இருந்தால், debug செய்து இயக்க முடியாது.

### Developer Team-ஐ அமைத்தல்

Xcode-இல் developer team கட்டாயமாக அமைக்கப்பட வேண்டும்; இல்லையெனில், app-க்கு signing செய்து அதை நிறுவ முடியாது.

அமைப்புப் பாதை:

Project Name → TARGETS → Signing & Capabilities → Team

இங்கு "Add Account..." என்று காட்டப்பட்டால், Apple account இன்னும் சேர்க்கப்படவில்லை என்பதைக் குறிக்கும்.

![Swift](../../RESOURCE/005_xcode5.png)

Add பொத்தானை அழுத்தி, உங்கள் Apple ID மூலம் sign in செய்யுங்கள்.

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID-யில் உள்நுழைந்த பிறகு, பொருத்தமான account-ஐத் தேர்வு செய்து developer team அமைப்பை முடிக்கவும்.

![Swift](../../RESOURCE/005_xcode7.png)

### சாதனத்தை இணைத்தல்

ஒரு cable பயன்படுத்தி iPhone-ஐ Mac-உடன் இணைக்கவும்.

முதல் முறை இணைக்கும் போது:

* Mac, இந்த iPhone-ஐ இந்த Mac-உடன் இணைக்க வேண்டுமா என்று கேட்கும்
* iPhone, இந்த கணினியை நம்பலாமா என்று கேட்கும்

கட்டாயமாக iPhone-இல் “Trust” என்பதைத் தட்டி, lock screen password-ஐ உள்ளிட வேண்டும். அதன் பிறகு, Xcode device list-இல் உங்கள் iPhone-ஐத் தேர்வு செய்யுங்கள்.

![Swift](../../RESOURCE/005_xcode9.png)

பிறகு, மேல் இடதுபுறத்தில் உள்ள Run பொத்தானை அழுத்துங்கள்.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode project-ஐ build செய்து, App-ஐ iPhone-இல் நிறுவும்.

![Swift](../../RESOURCE/005_view.png)

**Wireless Debugging**

iOS 11 மற்றும் அதற்கு பிந்தைய பதிப்புகளில், Xcode wireless debugging-ஐ ஆதரிக்கிறது.

![Swift](../../RESOURCE/005_xcode18.png)

முன் நிபந்தனைகள்:

1. iPhone மற்றும் Mac முதல் முறையாக கட்டாயமாக data cable மூலம் pair செய்யப்பட வேண்டும்
2. iPhone மற்றும் Mac இரண்டும் ஒரே Wi-Fi network-இல் இருக்க வேண்டும்
3. இரண்டு சாதனங்களும் unlock செய்யப்பட்ட நிலையில் இருக்க வேண்டும்

முதல் முறை data cable மூலம் pairing முடிந்த பிறகு, பின்னர் cable-ஐ அகற்றினாலும், அதே network-இல் இருந்தால் நேரடியாக run செய்யலாம்.

கவனிக்க வேண்டியவை:

* Device list-இல் சாதனம் தெரியவில்லை என்றால், மீண்டும் cable-ஐ இணைத்து பார்க்கலாம்
* Wi-Fi debugging சில நேரங்களில் நிலைத்தன்மையற்றதாக இருக்கலாம்; connection பிரச்சினை ஏற்பட்டால் cable-ஐ மீண்டும் இணைத்தால் போதும்
* Company network அல்லது isolated network சூழலில் இது கட்டுப்படுத்தப்படக்கூடும்

## பொதுவான பிழைகள் மற்றும் தீர்வுகள்

Xcode மூலம் iPhone-ஐ இணைத்து debug செய்யும் போது, பலவிதமான error message-கள் தோன்றலாம். கீழே சில பொதுவான பிரச்சினைகள் மற்றும் அவற்றிற்கான தீர்வுகள் கொடுக்கப்பட்டுள்ளன. இவை connection பிரச்சினைகளை விரைவாக கண்டறிந்து தீர்க்க உதவும்.

**1. Pairing இன்னும் முடிவடையவில்லை**

```swift
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

இதன் பொருள், Xcode மற்றும் iPhone இடையிலான debug pairing இன்னும் முடிவடையவில்லை என்பதாகும்.

தீர்வு: iPhone-இல் “Trust” அழுத்தப்பட்டதா என்பதை உறுதிப்படுத்துங்கள். இன்னும் error வந்தால், Xcode-ஐ restart செய்து மீண்டும் connect செய்யுங்கள்.

**2. Developer Team அமைக்கப்படவில்லை**

```swift
Signing for "SwiftSlimTest" requires a development team.
```

இது developer team அமைக்கப்படாததால் ஏற்படக்கூடும்.

தீர்வு: Signing & Capabilities பகுதியில் sign in செய்யப்பட்ட account-ஐத் தேர்வு செய்யுங்கள்.

**3. Developer Disk Image mount ஆகவில்லை**

```swift
Previous preparation error: The developer disk image could not be mounted on this device.
```

இது பொதுவாக installation நடுவில் துண்டிக்கப்பட்டபோது (உதாரணமாக cable-ஐ இழுத்தல், force stop செய்தல்) ஏற்படும். அதன் காரணமாக மறுபடியும் install செய்யும் போது கட்டுப்பாடுகள் தோன்றி இந்த error வரும்.

தீர்வு: iPhone-ஐ restart செய்து, மீண்டும் cable மூலம் இணைக்கவும்.

**4. Debug tunnel connection தோல்வி**

```swift
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

இந்த error பொதுவாக VPN அல்லது network proxy இடையூறு செய்தால் தோன்றும்.

தீர்வு: VPN அல்லது network proxy-ஐ அணைத்து வைத்து மீண்டும் முயற்சி செய்யுங்கள்.

**5. சாதனம் unlock செய்யப்படவில்லை**

```swift
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

சாதனம் lock நிலையில் உள்ளது; iPhone-ஐ unlock செய்தால் போதும்.

**6. சாதனம் பதிவு செய்யப்படவில்லை**

```swift
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

இதன் பொருள், இந்த device developer account-இன் device list-இல் சேர்க்கப்படவில்லை. அதனால், Xcode இந்த device-க்காக செல்லுபடியாகும் provisioning profile உருவாக்கி app-ஐ sign செய்து நிறுவ முடியாது.

தீர்வு: "Register Device" என்பதை அழுத்தி தானாகப் பதிவு செய்து விடலாம்.

**7. Deployment version பொருந்தவில்லை**

```swift
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

இதன் பொருள், device-இன் system version, project-இன் minimum deployment version-ஐ விட குறைவாக உள்ளது.

மாற்ற வேண்டிய பாதை:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

பதிப்பை, சாதனத்தின் system version-ஐ விட அதிகமாக இல்லாத வகையில் மாற்றுங்கள்.

மாற்றிய பிறகு, build folder-ஐ சுத்தம் செய்யுங்கள்:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

சுத்தம் செய்த பின் மீண்டும் run செய்யுங்கள்.
