# Xcode ची ओळख

## Xcode म्हणजे काय

Xcode हे Apple कडून अधिकृतपणे उपलब्ध करून दिलेले Integrated Development Environment आहे (IDE, Integrated Development Environment). ते iOS, macOS, watchOS, tvOS अशा Apple प्लॅटफॉर्म applications विकसित करण्यासाठी वापरले जाते.

![Swift](../../RESOURCE/001_xcode.png)

या संपूर्ण शिकवणी प्रक्रियेत आपण code लिहिण्यासाठी आणि programs चालविण्यासाठी Xcode वापरणार आहोत.

या पाठात आपण Xcode कसे download करायचे, पहिले iOS application कसे तयार करायचे, आणि Xcode interface ची प्राथमिक रचना कशी समजून घ्यायची हे शिकू.

## Xcode डाउनलोड करा

सध्या Xcode install करण्याचे दोन मार्ग आहेत:

1、[Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12) वरून download करा

2、[Apple Developer अधिकृत वेबसाइट](https://developer.apple.com/xcode/) वरून download करा

दोन्ही मार्गांनी Xcode download करता येते. फरक असा की Apple Developer वेबसाइटवर stable version सोबत [Beta](https://developer.apple.com/download/all/?q=Xcode) versions आणि historical versions सुद्धा उपलब्ध असतात.

फक्त development शिकण्यासाठी stable version वापरण्याची शिफारस केली जाते. Beta version मुख्यतः नवीन features चाचपण्यासाठी असते, त्यामुळे ती अस्थिर असू शकते.

## पहिला project तयार करा

Xcode उघडल्यानंतर startup interface दिसेल.

![Swift](../../RESOURCE/001_xcode1.png)

डाव्या बाजूला तीन सामान्य पर्याय असतात:

- Create New Project —— नवीन project तयार करा  
- Clone Git Repository —— Git repository clone करा  
- Open Existing Project —— आधीचा project उघडा

उजव्या बाजूला अलीकडे उघडलेले Xcode projects दिसतात.

आपण `"Create New Project"` हा पर्याय निवडू.

### Project template निवडा

![Swift](../../RESOURCE/001_xcode2.png)

यानंतर project template selection screen दिसेल. येथे अनेक platforms (iOS, macOS इ.) आणि विविध प्रकारचे project templates दिसतात.

सामान्य templates:
- App —— सर्वात basic application type (शिफारस केलेले)
- Document App —— document mode आधारित application
- Game —— game development साठी
- Framework —— पुन्हा वापरता येईल असे module

सुरुवातीच्या टप्प्यात आपण फक्त `"iOS" - "App"` template निवडू, कारण हा interface application चा मूलभूत प्रकार आहे.

त्यानंतर `"Next"` click करा.

### Project माहिती भरा

यानंतर project information form screen दिसेल. येथे field च्या प्रकारानुसार माहिती भरावी लागेल.

![Swift](../../RESOURCE/001_xcode3.png)

प्रत्येक field चा अर्थ:

- Product Name —— project चे नाव, उदाहरणार्थ: `SwiftSlimTest`
- Team —— developer team. Paid Apple Developer account नसल्यास हे रिकामे ठेवू शकता
- Organization Identifier —— organization identifier. हे सामान्यतः reverse domain format मध्ये असते, उदाहरणार्थ:
  - `com.yourname`
  - `com.yourcompany`
  - domain नसल्यास स्वतःचे इंग्रजी नाव वापरू शकता
- Bundle Identifier —— application चे unique identifier. हे Organization Identifier आणि Product Name वरून आपोआप तयार होते
- Interface —— UI technology, येथे `SwiftUI` निवडा
- Language —— development language, येथे `Swift` निवडा
- Testing System —— default ने test target (Unit Tests) तयार होते; सुरुवातीच्या टप्प्यात याकडे दुर्लक्ष करा
- Storage —— local data persistence framework. यात SwiftData किंवा Core Data integrate करता येते; सुरुवातीच्या टप्प्यात याकडे दुर्लक्ष करा

सर्व माहिती भरल्यानंतर `"Next"` click करा.

### Project save करा

![Swift](../../RESOURCE/001_xcode4.png)

Project save करण्यासाठी योग्य folder निवडा.

`"Create"` button click केल्यावर Xcode project structure आपोआप तयार करेल.

## Xcode project structure

Xcode project save केल्यानंतर, Finder मध्ये तयार झालेले project folder दिसेल.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— images, App icons आणि इतर resources ठेवण्यासाठी वापरला जाणारा folder

- ContentView.swift —— default ने तयार होणारी SwiftUI view file. पुढे आपण याच file मध्ये interface code लिहिणार आहोत.

- SwiftSlimTestApp.swift —— application entry file (App Entry Point). हे app launch करण्यासाठी जबाबदार असते; सध्या याबद्दल तपशीलात जाण्याची गरज नाही.

- SwiftSlimTest.xcodeproj —— Xcode project file. यावर double-click केल्यास project उघडेल.

## Xcode interface ची ओळख

`.xcodeproj` file वर double-click करून project उघडा, आणि डाव्या बाजूच्या Navigator area मधून `ContentView.swift` file निवडा.

Xcode interface मुख्यतः पाच भागांनी बनलेले आहे:

- Navigator —— navigation area, file structure पाहण्यासाठी आणि search करण्यासाठी
- Editor —— editing area, Swift किंवा SwiftUI code लिहिण्यासाठी
- Canvas —— canvas area, SwiftUI preview साठी
- Inspector —— property inspection area, file properties पाहण्यासाठी आणि बदलण्यासाठी
- Debug Area —— debugging area, logs output पाहण्यासाठी

![Swift](../../RESOURCE/001_xcode6.png)

टीप: Canvas मुख्यतः SwiftUI view preview साठी वापरले जाते. Xcode च्या अधिकृत architecture नुसार, ते Editor चे auxiliary preview pane आहे. फक्त SwiftUI view file उघडे असताना Canvas enable करता येते; इतर प्रकारच्या files मध्ये preview functionality दिसत नाही.

पुढील पाठमालिकेत आपण प्रामुख्याने Editor भागात Swift आणि SwiftUI code लिहू.

पहिल्यांदा Xcode project उघडल्यावर Inspector आणि Debug Area हे default ने hidden असू शकतात. वरच्या उजव्या कोपऱ्यात आणि खालच्या उजव्या कोपऱ्यातील buttons वापरून ते दाखवू शकता.

![Swift](../../RESOURCE/001_xcode7.png)

सूचना: Inspector भाग मुख्यतः file properties पाहणे आणि बदलणे यासाठी वापरला जातो. प्रत्यक्ष development मध्ये, अधिक editing space मिळवण्यासाठी तो अनेकदा hide करून ठेवला जातो.

## सारांश

या पाठात आपण Xcode कसे download करायचे, पहिले Xcode project कसे तयार करायचे, आणि Xcode interface चे मूलभूत layout काय आहे हे शिकलो.

आता मोकळ्या वेळात काही गोष्टी करून पाहा:
- Navigator भागात files तयार करणे आणि delete करणे करून पाहा.  
- Editor भागातील code पाहून त्याची रचना निरीक्षण करा.
- Canvas भागातील buttons पाहून preview zoom in / zoom out करून पाहा.

पुढील पाठात आपण काही सोपे code लिहायला सुरुवात करू, आणि त्यातून Xcode ची अजून चांगली ओळख करून घेऊ.  
