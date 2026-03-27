# Xcode को समझना

## Xcode क्या है

Xcode, Apple द्वारा प्रदान किया गया आधिकारिक Integrated Development Environment (IDE) है, जिसका उपयोग iOS, macOS, watchOS, tvOS आदि Apple प्लेटफ़ॉर्म ऐप विकसित करने के लिए किया जाता है।

![Swift](../../RESOURCE/001_xcode.png)

पूरे शिक्षण प्रक्रिया में हम code लिखने और program चलाने के लिए Xcode का उपयोग करेंगे।

इस पाठ में हम सीखेंगे कि Xcode कैसे डाउनलोड करें, पहला iOS ऐप कैसे बनाएँ, और Xcode interface structure को प्रारंभिक रूप से कैसे समझें।

## Xcode डाउनलोड करना

वर्तमान में Xcode इंस्टॉल करने के दो तरीके हैं:

1、[Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12) से डाउनलोड करना

2、[Apple Developer की आधिकारिक वेबसाइट](https://developer.apple.com/xcode/) से डाउनलोड करना

दोनों तरीकों से Xcode डाउनलोड किया जा सकता है। अंतर यह है कि Apple Developer वेबसाइट पर official version के अलावा [Beta](https://developer.apple.com/download/all/?q=Xcode) या historical versions भी डाउनलोड किए जा सकते हैं।

यदि आप केवल development सीख रहे हैं, तो official version का उपयोग करना बेहतर है। Beta version मुख्य रूप से नए features को test करने के लिए होता है, और इसमें instability हो सकती है।

## पहला प्रोजेक्ट बनाना

Xcode खोलने के बाद आपको startup screen दिखाई देगी।

![Swift](../../RESOURCE/001_xcode1.png)

बाईं ओर तीन सामान्य विकल्प होते हैं:

- `Create New Project` —— नया प्रोजेक्ट बनाना
- `Clone Git Repository` —— Git repository clone करना
- `Open Existing Project` —— मौजूदा प्रोजेक्ट खोलना

दाईं ओर हाल में खोले गए Xcode projects दिखाई देते हैं।

हम `"Create New Project"` विकल्प चुनेंगे।

### प्रोजेक्ट टेम्पलेट चुनना

![Swift](../../RESOURCE/001_xcode2.png)

अब आप project template selection screen में प्रवेश करेंगे, जहाँ कई platforms (जैसे iOS, macOS आदि) और अलग-अलग प्रकार के project templates दिखाई देंगे।

सामान्य template की व्याख्या:
- `App` —— सबसे बुनियादी application type (सिफारिश की जाती है)
- `Document App` —— document-based application
- `Game` —— game development के लिए
- `Framework` —— reusable module

शुरुआती चरण में हम केवल `"iOS" - "App"` template चुनेंगे, क्योंकि यही interface app type है।

`"Next"` पर क्लिक करें।

### प्रोजेक्ट जानकारी भरना

अब project information form दिखाई देगा, जहाँ हमें अलग-अलग fields के अनुसार जानकारी भरनी होगी।

![Swift](../../RESOURCE/001_xcode3.png)

हर field का अर्थ:

- `Product Name` —— प्रोजेक्ट का नाम, उदाहरण: `SwiftSlimTest`
- `Team` —— developer team, यदि आपके पास paid Apple Developer account नहीं है तो इसे खाली छोड़ सकते हैं
- `Organization Identifier` —— संगठन पहचानकर्ता, आमतौर पर reverse domain format में, जैसे:
  - `com.yourname`
  - `com.yourcompany`
  - यदि आपके पास domain नहीं है, तो आप अपने अंग्रेज़ी नाम का उपयोग कर सकते हैं
- `Bundle Identifier` —— app का unique identifier, जो `Organization Identifier` और `Product Name` के आधार पर अपने-आप बनता है
- `Interface` —— interface technology, यहाँ `SwiftUI` चुनें
- `Language` —— development language, यहाँ `Swift` चुनें
- `Testing System` —— default रूप से test target (`Unit Tests`) बनता है; शुरुआती चरण में इसे नज़रअंदाज़ किया जा सकता है
- `Storage` —— local data persistence framework; SwiftData या Core Data को auto-integrate कर सकता है; शुरुआती चरण में इसे भी नज़रअंदाज़ किया जा सकता है

सारी जानकारी भरने के बाद `"Next"` पर क्लिक करें।

### प्रोजेक्ट सेव करना

![Swift](../../RESOURCE/001_xcode4.png)

प्रोजेक्ट सेव करने के लिए एक उपयुक्त folder चुनें।

`"Create"` बटन पर क्लिक करें, और Xcode अपने-आप project structure बना देगा।

## Xcode प्रोजेक्ट संरचना

प्रोजेक्ट सेव करने के बाद, Finder में generated project folder दिखाई देगा।

![Swift](../../RESOURCE/001_xcode5.png)

- `Assets.xcassets` —— images, app icons आदि resources रखने का folder

- `ContentView.swift` —— default रूप से generated SwiftUI view file, जिसमें हम आगे interface code लिखेंगे

- `SwiftSlimTestApp.swift` —— app entry point file, जो application launch करने के लिए ज़िम्मेदार है; अभी इसे विस्तार से समझने की ज़रूरत नहीं है

- `SwiftSlimTest.xcodeproj` —— Xcode project file; इस पर double-click करके project खोला जा सकता है

## Xcode इंटरफ़ेस को समझना

प्रोजेक्ट खोलने के लिए `.xcodeproj` file पर double-click करें, और फिर बाईं ओर `Navigator` क्षेत्र में `ContentView.swift` चुनें।

Xcode interface मुख्य रूप से पाँच क्षेत्रों से बना होता है:

- `Navigator` —— navigation area, file structure देखने और search करने के लिए
- `Editor` —— editing area, Swift या SwiftUI code लिखने के लिए
- `Canvas` —— canvas area, SwiftUI preview के लिए
- `Inspector` —— property inspection area, file properties देखने और बदलने के लिए
- `Debug Area` —— debug area, log output देखने के लिए

![Swift](../../RESOURCE/001_xcode6.png)

ध्यान दें: `Canvas` मुख्य रूप से SwiftUI view preview के लिए होता है। Xcode की आधिकारिक architecture के अनुसार, यह Editor का सहायक preview panel (`Preview Pane`) है। केवल SwiftUI view file खोलने पर ही Canvas को सक्रिय किया जा सकता है; अन्य प्रकार की files में preview सुविधा दिखाई नहीं देगी।

आगे के पाठों में हम मुख्य रूप से `Editor` क्षेत्र में Swift और SwiftUI code लिखेंगे।

जब आप पहली बार Xcode project खोलते हैं, तो `Inspector` और `Debug Area` डिफ़ॉल्ट रूप से छिपे हो सकते हैं। इन्हें ऊपर दाईं ओर और नीचे दाईं ओर के buttons से दिखाया जा सकता है।

![Swift](../../RESOURCE/001_xcode7.png)

टिप: `Inspector` क्षेत्र मुख्य रूप से file properties देखने और बदलने के लिए उपयोग होता है। वास्तविक development में अधिक editing space पाने के लिए इसे अक्सर छिपा दिया जाता है।

## सारांश

इस पाठ में हमने सीखा कि Xcode कैसे डाउनलोड किया जाता है, पहला Xcode project कैसे बनाया जाता है, और Xcode interface की बुनियादी layout क्या है।

अब थोड़ा स्वतंत्र अभ्यास करें:
- `Navigator` क्षेत्र में file create और delete करने की कोशिश करें
- `Editor` क्षेत्र में code देखें और उसकी structure को observe करें
- `Canvas` क्षेत्र के buttons देखें और preview को zoom in / zoom out करने की कोशिश करें

अगले पाठ में हम कुछ सरल code लिखना शुरू करेंगे, और इससे Xcode को और गहराई से समझ पाएँगे।
