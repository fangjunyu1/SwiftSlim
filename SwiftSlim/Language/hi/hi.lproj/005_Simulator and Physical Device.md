# सिम्युलेटर और वास्तविक डिवाइस

अब तक हम basic view बनाना पूरा कर चुके हैं। इस पाठ का मुख्य विषय है यह सीखना कि App को simulator और physical device पर कैसे चलाया जाए।

मुझे आज भी याद है जब मैंने पहली बार अपने iPhone पर App install किया था, तो मैं बहुत खुश था, क्योंकि मैं अपने development results को और अधिक सीधे देख सकता था। यह एक positive feedback है। जब हम अपनी बनाई हुई App का उपयोग कर सकते हैं, तो रुचि हमें और अधिक ज्ञान सीखने के लिए स्वाभाविक रूप से प्रेरित करती है।

अब, पिछले पाठ में पूरा किया गया व्यक्तिगत रिज्यूमे project खोलें, और simulator तथा physical device चलाने की तैयारी करें।

## सिम्युलेटर

Xcode में कई built-in simulators होते हैं, जो अलग-अलग models के iPhone, iPad और Apple Watch को cover करते हैं। simulator यह verify कर सकता है कि App अलग-अलग models या versions पर layout में कैसे अंतर दिखाती है।

### सिम्युलेटर चुनना

Xcode की शीर्ष toolbar में device list से एक simulator चुनें (जैसे `iPhone 16`)।

![Swift](../../RESOURCE/005_xcode.png)

### सिम्युलेटर चलाना

फिर ऊपर बाईं ओर run button पर क्लिक करें।

![Swift](../../RESOURCE/005_xcode1.png)

Xcode अपने आप project build करेगा और simulator शुरू करेगा।

![Swift](../../RESOURCE/005_xcode2.png)

### सिम्युलेटर बंद करना

यदि simulator बंद करना हो, तो Xcode toolbar में stop button पर क्लिक करें।

![Swift](../../RESOURCE/005_xcode3.png)

आप simulator को सीधे बंद भी कर सकते हैं:

![Swift](../../RESOURCE/005_xcode17.png)

यदि simulator को सीधे बंद करते हैं, तो Xcode यह prompt दिखा सकता है:

```
Thread 1: signal SIGTERM
```

यह आम तौर पर program logic की error नहीं होती, बल्कि इसलिए होता है क्योंकि debugging process को बाहर से terminate किया गया। आम तौर पर इसे ignore किया जा सकता है; यह application logic error नहीं है।

Xcode preview की तुलना में simulator अधिक वास्तविक runtime environment के करीब है। लेकिन यह फिर भी पूर्ण device environment नहीं है। यह layout verification और multi-device adaptation testing के लिए उपयुक्त है।

## टेस्ट environment की प्राथमिकता

वास्तविक development workflow में, निम्न test order का पालन करना चाहिए:

physical device > simulator > Xcode preview

preview तेज़ी से UI adjust करने के लिए उपयुक्त है; simulator structural testing के लिए उपयुक्त है; अंतिम verification physical device पर ही पूरी होनी चाहिए, विशेष रूप से iCloud से संबंधित operations के लिए।

## वास्तविक डिवाइस

Xcode preview और simulator दोनों में inaccurate display हो सकती है, इसलिए physical device निर्णायक महत्व रखता है। system permissions, performance, notification mechanism जैसी behaviors केवल physical device पर ही पूरी तरह verify की जा सकती हैं।

### Developer Mode चालू करना

iPhone में:

Settings → Privacy & Security → Developer Mode → चालू करें

![Swift](../../RESOURCE/005_xcode4.png)

system device को force restart करेगा। Developer Mode चालू किए बिना debugging run संभव नहीं होगी।

### Developer Team कॉन्फ़िगर करना

Xcode में developer team configure होना आवश्यक है, अन्यथा application पर signing करके install नहीं किया जा सकेगा।

configuration path:

project name → TARGETS → Signing & Capabilities → Team

यदि `"Add Account..."` दिखाई दे, तो इसका अर्थ है कि अभी Apple account नहीं जोड़ा गया है।

![Swift](../../RESOURCE/005_xcode5.png)

add button पर क्लिक करें, और Apple ID से sign in करें।

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID में sign in करने के बाद, संबंधित account चुनकर developer team configuration पूरी करें।

![Swift](../../RESOURCE/005_xcode7.png)

### डिवाइस कनेक्ट करना

एक cable के माध्यम से iPhone को Mac से जोड़ें।

पहली बार connect करते समय:

- Mac पूछेगा कि क्या iPhone को इस Mac से कनेक्ट करना है
- iPhone पूछेगा कि क्या इस computer पर trust करना है

आपको iPhone पर "Trust" पर क्लिक करना होगा और lock screen password दर्ज करना होगा। उसके बाद, Xcode device list में अपना iPhone चुनें।

![Swift](../../RESOURCE/005_xcode9.png)

ऊपर बाईं ओर run button पर क्लिक करें।

![Swift](../../RESOURCE/005_xcode1.png)

Xcode project build करेगा और App को iPhone पर install कर देगा।

![Swift](../../RESOURCE/005_view.png)

**wireless debugging**

iOS 11 और उसके बाद के versions में, Xcode wireless debugging को support करता है।

![Swift](../../RESOURCE/005_xcode18.png)

पूर्व शर्तें:

1. iPhone और Mac की पहली pairing data cable के साथ पूरी होनी चाहिए
2. iPhone और Mac एक ही Wi-Fi network पर हों
3. दोनों devices unlocked रहें

पहली बार cable से pairing पूरी करने के बाद, बाद में cable निकाल देने पर भी, यदि दोनों एक ही network environment में हैं, तो सीधे run किया जा सकता है।

ध्यान देने योग्य बातें:

- यदि device device list में न दिखे, तो cable दोबारा लगाकर connect करें
- Wi-Fi debugging कभी-कभी unstable हो सकती है; connection exception पर cable फिर से जोड़ें
- company network या isolated network environment में यह restricted हो सकता है

## सामान्य errors और solutions

जब Xcode iPhone से connect होकर debug करता है, तो अलग-अलग प्रकार के error messages आ सकते हैं। नीचे कुछ सामान्य समस्याएँ और उनके solutions दिए गए हैं, जो जल्दी problem locate करने और connection issue को solve करने में मदद करेंगे।

**1. pairing पूरी नहीं हुई**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

इसका अर्थ है कि Xcode और iPhone के बीच debugging pairing अभी पूरी नहीं हुई है।

समाधान: पुष्टि करें कि iPhone पर "Trust" दबाया गया है। यदि फिर भी error आए, तो Xcode restart करके दोबारा connect करें।

**2. Developer Team configure नहीं है**

```
Signing for "SwiftSlimTest" requires a development team.
```

यह हो सकता है कि developer team configure न की गई हो।

समाधान: `Signing & Capabilities` में signed-in account चुनें।

**3. Developer Disk Image mount नहीं हो रहा**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

यह आम तौर पर installation के बीच में बाधित होने पर होता है (जैसे cable निकालना, force stop करना), जिसके कारण दोबारा install करते समय restriction लग जाती है और error आती है।

समाधान: iPhone restart करें, और cable दोबारा जोड़ें।

**4. debug tunnel connection असफल**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

यह error अक्सर VPN या network proxy के हस्तक्षेप से आती है।

समाधान: VPN या network proxy बंद करके फिर से प्रयास करें।

**5. device unlocked नहीं है**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

device lock screen state में है; iPhone unlock कर दें।

**6. device register नहीं है**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

यह दर्शाता है कि यह device developer account की device list में शामिल नहीं है, इसलिए Xcode इसके लिए वैध provisioning profile बनाकर app sign और install नहीं कर सकता।

समाधान: `"Register Device"` पर क्लिक करके automatic registration कर दें।

**7. deployment version mismatch**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

इसका अर्थ है कि device का system version project के minimum deployment version से कम है।

संशोधन path:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

version को device के system version से अधिक न रखें।

संशोधन के बाद, build folder साफ करें:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

साफ करने के बाद फिर से run करें।
