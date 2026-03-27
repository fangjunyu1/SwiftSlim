# सिम्युलेटर आणि प्रत्यक्ष डिव्हाइस

आतापर्यंत आपण मूलभूत views तयार करणे पूर्ण केले आहे. या धड्याचा मुख्य विषय म्हणजे App सिम्युलेटर आणि प्रत्यक्ष डिव्हाइस (Physical Device) वर कसा चालवायचा हे शिकणे.

मला अजूनही आठवते, पहिल्यांदा मी App iPhone वर install केला तेव्हा मला खूप आनंद झाला होता, कारण मी माझे विकासकार्य अधिक प्रत्यक्षपणे पाहू शकलो. हा एक सकारात्मक feedback असतो. जेव्हा आपण स्वतः बनवलेला App वापरू शकतो, तेव्हा उत्सुकता आपल्याला आपोआप अधिक ज्ञान शिकण्यास प्रवृत्त करते.

आता कृपया मागील धड्यात पूर्ण केलेला वैयक्तिक रेझ्युमे प्रकल्प उघडा आणि सिम्युलेटर व प्रत्यक्ष डिव्हाइस चालवण्यासाठी तयार व्हा.

## सिम्युलेटर

Xcode मध्ये अनेक प्रकारचे सिम्युलेटर अंतर्भूत असतात, जे वेगवेगळ्या iPhone, iPad आणि Apple Watch मॉडेल्स कव्हर करतात. सिम्युलेटरद्वारे App च्या interface layout मधील फरक वेगवेगळ्या मॉडेल किंवा versions वर तपासता येतात.

### सिम्युलेटर निवडणे

Xcode च्या वरच्या toolbar मधील device list मधून एक सिम्युलेटर निवडा (उदाहरणार्थ iPhone 16).

![Swift](../../RESOURCE/005_xcode.png)

### सिम्युलेटर चालवणे

त्यानंतर डाव्या वरच्या कोपऱ्यातील run button वर क्लिक करा.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode आपोआप project build करून सिम्युलेटर सुरू करेल.

![Swift](../../RESOURCE/005_xcode2.png)

### सिम्युलेटर बंद करणे

सिम्युलेटर बंद करायचा असल्यास, Xcode toolbar मधील stop button वर क्लिक करा.

![Swift](../../RESOURCE/005_xcode3.png)

किंवा तुम्ही थेट सिम्युलेटर विंडोही बंद करू शकता:

![Swift](../../RESOURCE/005_xcode17.png)

जर तुम्ही थेट सिम्युलेटर बंद केला, तर Xcode खालीलप्रमाणे prompt दाखवू शकतो:

```
Thread 1: signal SIGTERM
```

हे सहसा program logic error नसते, तर debug process बाहेरून terminate झाल्यामुळे असे होते. साधारणपणे हे दुर्लक्ष करता येते आणि ते application logic error मध्ये मोडत नाही.

Xcode preview च्या तुलनेत, सिम्युलेटर अधिक वास्तविक runtime environment च्या जवळ असतो. पण तरीही तो पूर्ण device environment नसतो. तो layout verification आणि विविध device adaptation testing साठी उपयुक्त आहे.

## चाचणी वातावरणाची प्राधान्यक्रम

प्रत्यक्ष development flow मध्ये, पुढील चाचणी क्रम पाळावा:

प्रत्यक्ष डिव्हाइस > सिम्युलेटर > Xcode Preview

Preview वेगाने UI समायोजित करण्यासाठी योग्य आहे; सिम्युलेटर संरचनात्मक चाचण्यांसाठी योग्य आहे; अंतिम पडताळणी मात्र प्रत्यक्ष डिव्हाइसवरच करावी, विशेषतः iCloud संबंधित ऑपरेशन्ससाठी.

## प्रत्यक्ष डिव्हाइस

Xcode preview आणि सिम्युलेटर दोन्ही ठिकाणी display अचूक नसू शकतो, म्हणून प्रत्यक्ष डिव्हाइसला निर्णायक महत्त्व आहे. system permissions, performance, notification mechanism यांसारखे व्यवहार फक्त प्रत्यक्ष डिव्हाइसवरच पूर्णपणे पडताळता येतात.

### Developer Mode चालू करणे

iPhone मध्ये:

Settings → Privacy & Security → Developer Mode → चालू

![Swift](../../RESOURCE/005_xcode4.png)

system डिव्हाइसला force restart करेल. Developer Mode चालू नसल्यास debug run शक्य नाही.

### Developer Team कॉन्फिगर करणे

Xcode मध्ये Developer Team कॉन्फिगर केलेली असणे आवश्यक आहे, अन्यथा app sign करून install करता येणार नाही.

कॉन्फिगरेशन प्रक्रिया:

Project Name → TARGETS → Signing & Capabilities → Team

जर "Add Account..." दिसत असेल, तर Apple account अजून जोडलेले नाही.

![Swift](../../RESOURCE/005_xcode5.png)

Add button वर क्लिक करून Apple ID ने login करा.

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID ने login केल्यानंतर, योग्य account निवडा आणि Developer Team configuration पूर्ण करा.

![Swift](../../RESOURCE/005_xcode7.png)

### डिव्हाइस जोडणे

कनेक्शन केबल वापरून iPhone आणि Mac जोडा.

पहिल्यांदा जोडताना:

- Mac विचारेल की हा iPhone या Mac शी जोडायचा आहे का
- iPhone विचारेल की या संगणकावर विश्वास ठेवायचा का

iPhone वर "Trust" वर क्लिक करून lock-screen password टाकणे आवश्यक आहे. त्यानंतर, Xcode device list मध्ये तुमचा iPhone निवडा.

![Swift](../../RESOURCE/005_xcode9.png)

डाव्या वरच्या कोपऱ्यातील run button वर क्लिक करा.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode project build करून App iPhone वर install करेल.

![Swift](../../RESOURCE/005_view.png)

**वायरलेस debug**

iOS 11 आणि त्यानंतरच्या versions मध्ये, Xcode wireless debugging ला support करते.

![Swift](../../RESOURCE/005_xcode18.png)

पूर्वअट:

1. iPhone आणि Mac यांची पहिली pairing data cable वापरूनच पूर्ण करावी
2. iPhone आणि Mac एकाच Wi-Fi network वर असावेत
3. दोन्ही devices unlocked स्थितीत असावेत

पहिल्या वेळी data cable ने pairing पूर्ण केल्यानंतर, नंतर cable काढला तरी, एकाच network environment मध्ये असताना थेट run करता येते.

लक्षात ठेवण्यासारख्या गोष्टी:

- जर device device list मध्ये दिसत नसेल, तर पुन्हा data cable लावून connection करा
- Wi-Fi debugging कधी कधी अस्थिर असू शकते; connection error आल्यास cable पुन्हा जोडा
- कंपनीच्या network किंवा isolated network environment मध्ये मर्यादा असू शकतात

## सामान्य त्रुटी आणि उपाय

Xcode वापरून iPhone शी debug connection करताना, विविध प्रकारचे error messages दिसू शकतात. खाली काही सामान्य समस्या आणि त्यांचे उपाय दिले आहेत, ज्यामुळे connection error पटकन शोधून सोडवता येईल.

**1. pairing पूर्ण झालेले नाही**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

याचा अर्थ Xcode आणि iPhone यांच्यातील debug pairing अजून पूर्ण झालेले नाही.

उपाय: iPhone वर "Trust" क्लिक केले आहे याची खात्री करा. तरीही error असेल, तर Xcode restart करून पुन्हा connect करा.

**2. Developer Team कॉन्फिगर केलेली नाही**

```
Signing for "SwiftSlimTest" requires a development team.
```

कदाचित Developer Team कॉन्फिगर केलेली नसावी.

उपाय: `Signing & Capabilities` मध्ये login केलेले account निवडा.

**3. Developer Disk Image mount होत नाही**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

हे सहसा installation दरम्यान मध्येच प्रक्रिया तुटल्यावर दिसते (उदा. cable काढणे, force stop), ज्यामुळे पुन्हा install करताना मर्यादा येतात आणि error दिसतो.

उपाय: iPhone restart करा आणि cable पुन्हा लावून connect करा.

**4. debug tunnel connection अयशस्वी**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

हा error VPN किंवा network proxy मुळे interference झाल्यास सामान्यतः दिसतो.

उपाय: VPN किंवा network proxy बंद करून पुन्हा प्रयत्न करा.

**5. device unlocked नाही**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

डिव्हाइस lock-screen स्थितीत आहे; iPhone unlock केला की समस्या सुटेल.

**6. डिव्हाइस नोंदणीकृत नाही**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

याचा अर्थ हे डिव्हाइस developer account च्या device list मध्ये जोडलेले नाही, त्यामुळे Xcode त्यासाठी वैध provisioning profile तयार करून app sign आणि install करू शकत नाही.

उपाय: "Register Device" वर क्लिक करून स्वयंचलित नोंदणी करा.

**7. deployment version mismatch**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

याचा अर्थ डिव्हाइसची system version ही project च्या minimum deployment version पेक्षा कमी आहे.

बदलण्याचा मार्ग:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

version ही device system version पेक्षा जास्त नसावी अशा प्रकारे समायोजित करा.

बदल केल्यानंतर, build folder साफ करा:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

clean पूर्ण झाल्यावर पुन्हा run करा.
