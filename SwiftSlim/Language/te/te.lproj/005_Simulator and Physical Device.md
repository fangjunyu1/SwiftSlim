# సిమ్యులేటర్ మరియు నిజమైన పరికరం

ఇప్పటివరకు, మనం ప్రాథమిక view నిర్మాణాన్ని పూర్తి చేశాము. ఈ పాఠంలోని ప్రధాన విషయం, App ను simulator మరియు నిజమైన పరికరం (Physical Device) మీద ఎలా నడపాలో నేర్చుకోవడం.

నేను మొదటిసారి నా App ను iPhone లో ఇన్‌స్టాల్ చేసినప్పుడు నాకు చాలా ఆనందంగా అనిపించింది, ఎందుకంటే నేను అభివృద్ధి చేసిన ఫలితాన్ని మరింత ప్రత్యక్షంగా చూడగలిగాను. ఇది ఒక సానుకూల ప్రతిస్పందన. మనం మనమే తయారు చేసిన App ను నిజంగా ఉపయోగించగలిగితే, ఆ ఆసక్తి మనల్ని మరింత జ్ఞానం నేర్చుకునేలా ముందుకు నడిపిస్తుంది.

ఇప్పుడు, గత పాఠంలో పూర్తిచేసిన వ్యక్తిగత రిజ్యూమే ప్రాజెక్ట్‌ను తెరిచి, simulator మరియు నిజమైన పరికరంలో నడపడానికి సిద్ధమవ్వండి.

## సిమ్యులేటర్

Xcode లో అనేక built-in simulators ఉంటాయి. వీటిలో వేర్వేరు మోడళ్ల iPhone, iPad మరియు Apple Watch ఉంటాయి. Simulator ద్వారా App వేర్వేరు పరికర మోడళ్లలో లేదా సిస్టమ్ వెర్షన్‌లలో ఎలా కనిపిస్తుందో, layout తేడాలను పరీక్షించవచ్చు.

### సిమ్యులేటర్‌ను ఎంచుకోవడం

Xcode పైభాగంలోని toolbar లో ఉన్న device list లో, ఒక simulator ను ఎంచుకోండి. ఉదాహరణకు iPhone 16.

![Swift](../../RESOURCE/005_xcode.png)

### సిమ్యులేటర్‌ను నడపడం

తర్వాత ఎడమ పై మూలలో ఉన్న Run button ను క్లిక్ చేయండి.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode ఆటోమేటిక్‌గా project ను build చేసి, simulator ను ప్రారంభిస్తుంది.

![Swift](../../RESOURCE/005_xcode2.png)

### సిమ్యులేటర్‌ను మూసివేయడం

Simulator ను మూసివేయాలనుకుంటే, Xcode toolbar లోని stop button ను క్లిక్ చేయండి.

![Swift](../../RESOURCE/005_xcode3.png)

లేదా simulator ను నేరుగా కూడా మూసివేయవచ్చు:

![Swift](../../RESOURCE/005_xcode17.png)

Simulator ను నేరుగా మూసివేస్తే, Xcode ఈ సందేశాన్ని చూపించవచ్చు:

```swift
Thread 1: signal SIGTERM
```

ఇది సాధారణంగా program logic లోపం కాదు. బయట నుంచి debug process నిలిపివేయబడినందువల్ల ఈ సందేశం వస్తుంది. సాధారణంగా దీన్ని పట్టించుకోనవసరం లేదు. ఇది App logic error కు చెందదు.

Xcode preview తో పోలిస్తే, simulator నిజమైన run environment కు ఎక్కువ దగ్గరగా ఉంటుంది. అయినప్పటికీ, ఇది పూర్తిస్థాయి device environment కాదు. ఇది layout verification మరియు వేర్వేరు device models కు సరిపోయేలా test చేయడానికి అనుకూలంగా ఉంటుంది.

## పరీక్షా వాతావరణాల ప్రాధాన్యత క్రమం

నిజమైన అభివృద్ధి ప్రక్రియలో, ఈ క్రమాన్ని అనుసరించడం మంచిది:

నిజమైన పరికరం > సిమ్యులేటర్ > Xcode preview

Preview వేగంగా UI మార్చి చూడడానికి అనుకూలం; simulator నిర్మాణాత్మక పరీక్షలకు అనుకూలం; చివరి ధృవీకరణ మాత్రం తప్పనిసరిగా నిజమైన పరికరంలో చేయాలి, ప్రత్యేకంగా iCloud సంబంధించిన పనుల విషయంలో.

## నిజమైన పరికరం

Xcode preview మరియు simulator రెండింటిలోనూ కొన్ని సందర్భాల్లో చూపింపులో తేడాలు ఉండవచ్చు. అందువల్ల నిజమైన పరికరం మీద పరీక్షకు నిర్ణయాత్మక ప్రాముఖ్యత ఉంటుంది. System permissions, performance, notification behavior వంటి అంశాలను పూర్తిగా ధృవీకరించడానికి నిజమైన పరికరం మాత్రమే సరిపోతుంది.

### డెవలపర్ మోడ్‌ను ఆన్ చేయడం

iPhone లో:

Settings → Privacy & Security → Developer Mode → On

![Swift](../../RESOURCE/005_xcode4.png)

System పరికరాన్ని బలవంతంగా restart చేస్తుంది. Developer Mode ఆన్ చేయకపోతే debug run చేయడం సాధ్యం కాదు.

### డెవలపర్ టీమ్‌ను కాన్ఫిగర్ చేయడం

Xcode లో developer team ను configure చేయాలి. లేకపోతే App ను sign చేసి install చేయడం సాధ్యం కాదు.

Configuration మార్గం:

Project Name → TARGETS → Signing & Capabilities → Team

ఒకవేళ "Add Account..." కనిపిస్తే, Apple account ఇంకా జోడించలేదని అర్థం.

![Swift](../../RESOURCE/005_xcode5.png)

Add button ను క్లిక్ చేసి, Apple ID తో login చేయండి.

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID తో login చేసిన తర్వాత, తగిన account ను ఎంచుకుని developer team configuration ను పూర్తి చేయండి.

![Swift](../../RESOURCE/005_xcode7.png)

### పరికరాన్ని కనెక్ట్ చేయడం

ఒక data cable ద్వారా iPhone ను Mac కు కనెక్ట్ చేయండి.

మొదటిసారి కనెక్ట్ చేసినప్పుడు:

* Mac, ఈ iPhone ను ఈ Mac కు కనెక్ట్ చేయాలా అని అడుగుతుంది
* iPhone, ఈ కంప్యూటర్‌ను నమ్మాలా అని అడుగుతుంది

తప్పనిసరిగా iPhone లో “Trust” ను నొక్కి, lock screen password ను నమోదు చేయాలి. తరువాత Xcode device list లో మీ iPhone ను ఎంచుకోండి.

![Swift](../../RESOURCE/005_xcode9.png)

అప్పుడూ ఎడమ పై మూలలోని Run button ను క్లిక్ చేయండి.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode project ను build చేసి, App ను iPhone లో install చేస్తుంది.

![Swift](../../RESOURCE/005_view.png)

**వైర్‌లెస్ డీబగ్గింగ్**

iOS 11 మరియు ఆ తరువాతి వెర్షన్‌లలో, Xcode wireless debugging ను support చేస్తుంది.

![Swift](../../RESOURCE/005_xcode18.png)

దీనికి అవసరమైన షరతులు:

1. iPhone మరియు Mac మొదటిసారి తప్పనిసరిగా cable ద్వారా pair కావాలి
2. iPhone మరియు Mac ఒకే Wi-Fi network లో ఉండాలి
3. రెండు పరికరాలూ unlocked గా ఉండాలి

మొదటిసారి cable ద్వారా pairing పూర్తయిన తరువాత, తరువాత cable తీసేసినా, ఒకే network లో ఉంటే నేరుగా run చేయవచ్చు.

గమనించాల్సిన విషయాలు:

* ఒకవేళ device list లో పరికరం కనిపించకపోతే, cable ను మళ్లీ connect చేయండి
* Wi-Fi debugging కొన్నిసార్లు స్థిరంగా ఉండకపోవచ్చు; connection సమస్య వస్తే cable ను మళ్లీ పెట్టండి
* కంపెనీ network లేదా isolated network వాతావరణాల్లో ఇది పరిమితం చేయబడవచ్చు

## సాధారణ లోపాలు మరియు పరిష్కారాలు

Xcode ద్వారా iPhone ను connect చేసి debug చేస్తుంటే, వేర్వేరు రకాల error messages రావచ్చు. కింద కొన్ని సాధారణ సమస్యలు మరియు వాటి పరిష్కారాలు ఇవ్వబడ్డాయి. ఇవి connection సమస్యలను త్వరగా గుర్తించి పరిష్కరించడంలో సహాయపడతాయి.

**1. Pairing పూర్తి కాలేదు**

```swift
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

దీనర్థం Xcode మరియు iPhone మధ్య debugging pairing ఇంకా పూర్తికాలేదు.

పరిష్కారం: iPhone లో "Trust" నొక్కబడ్డదని నిర్ధారించండి. ఇంకా అదే error వస్తే, Xcode ను restart చేసి మళ్లీ connect చేయండి.

**2. Developer team configure చేయబడలేదు**

```swift
Signing for "SwiftSlimTest" requires a development team.
```

ఇది developer team configure చేయలేదని సూచించవచ్చు.

పరిష్కారం: Signing & Capabilities లో login చేసిన account ను ఎంచుకోండి.

**3. Developer Disk Image mount కాలేకపోయింది**

```swift
Previous preparation error: The developer disk image could not be mounted on this device.
```

ఇది సాధారణంగా installation ప్రక్రియ మధ్యలో ఆగిపోయినప్పుడు వస్తుంది. ఉదాహరణకు cable తీసేయడం లేదా బలవంతంగా నిలిపివేయడం. దాంతో మళ్లీ install చేసే సమయంలో పరిమితి ఏర్పడి error వస్తుంది.

పరిష్కారం: iPhone ను restart చేసి, cable ను మళ్లీ కనెక్ట్ చేయండి.

**4. Debug tunnel connection విఫలమైంది**

```swift
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

ఈ error సాధారణంగా VPN లేదా network proxy జోక్యం వల్ల వస్తుంది.

పరిష్కారం: VPN లేదా network proxy ను ఆఫ్ చేసి, మళ్లీ ప్రయత్నించండి.

**5. పరికరం unlock కాలేదు**

```swift
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

పరికరం lock screen లో ఉంది. iPhone ను unlock చేస్తే సరిపోతుంది.

**6. పరికరం నమోదు కాలేదు**

```swift
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

దీనర్థం ఈ పరికరం developer account లోని device list లో చేరలేదు. అందువల్ల Xcode దీనికి సరైన provisioning profile సృష్టించి app ను sign చేసి install చేయలేకపోతుంది.

పరిష్కారం: "Register Device" ను క్లిక్ చేసి ఆటోమేటిక్‌గా నమోదు చేయండి.

**7. Deployment version సరిపోలడం లేదు**

```swift
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

ఇది పరికరం యొక్క system version, project యొక్క minimum deployment version కంటే తక్కువగా ఉందని సూచిస్తుంది.

మార్పు చేయాల్సిన మార్గం:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Version ను పరికరం system version కంటే ఎక్కువ కాకుండా సవరించండి.

మార్చిన తరువాత, build folder ను clean చేయండి:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Clean పూర్తైన తర్వాత మళ్లీ run చేయండి.
