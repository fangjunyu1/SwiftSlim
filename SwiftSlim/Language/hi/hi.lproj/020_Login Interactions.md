# लॉगिन इंटरैक्शन

पिछले पाठ में, हमने एक लॉगिन व्यू बनाया था, और बटन तथा निर्णय लॉजिक के माध्यम से इनपुट सामग्री की सरल जाँच लागू की थी।

इस पाठ में, हम पिछले पाठ के कोड को आधार बनाकर `SecureField` पासवर्ड इनपुट बॉक्स, `Alert` चेतावनी बॉक्स, और वेरिएबल्स के आधार पर अलग-अलग व्यू कैसे दिखाए जाते हैं, यह सीखेंगे।

इस पाठ के माध्यम से, आप लॉगिन व्यू के मूल इंटरैक्शन प्रवाह को और अच्छी तरह समझ पाएंगे, और यह कई ऐप्स में इस्तेमाल होने वाला एक बुनियादी लॉजिक भी है।

## पासवर्ड इनपुट बॉक्स

पिछले पाठ में, हमने पासवर्ड दर्ज करने के लिए `TextField` का उपयोग किया था।

लेकिन वास्तविक लॉगिन इंटरफेस में, पासवर्ड आमतौर पर सीधे दिखाई नहीं देता, बल्कि डॉट्स या किसी अन्य छिपे हुए प्रभाव के रूप में दिखाया जाता है, ताकि उपयोगकर्ता की गोपनीयता सुरक्षित रह सके।

SwiftUI में, पासवर्ड दर्ज करने के लिए विशेष रूप से उपयोग किया जाने वाला कंट्रोल `SecureField` है।

उदाहरण के लिए:

```swift
SecureField("Password", text: $password)
```

इसका लिखने का तरीका `TextField` जैसा ही है। इसमें भी एक संकेतात्मक टेक्स्ट और एक बाउंड वेरिएबल की आवश्यकता होती है।

इसे सरल रूप से ऐसे समझा जा सकता है: `SecureField` भी एक इनपुट बॉक्स है, बस यह दर्ज की गई सामग्री को छिपा देता है।

हम पहले पासवर्ड दर्ज करने के लिए उपयोग किए जाने वाले `TextField` को सीधे `SecureField` में बदल सकते हैं:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

जब उपयोगकर्ता पासवर्ड दर्ज करेगा, तो पासवर्ड की सामग्री इंटरफेस पर सीधे दिखाई नहीं देगी।

दिखाने का प्रभाव:

![password](../../Resource/020_password.png)

अब, हम यूज़रनेम और पासवर्ड दर्ज कर सकते हैं, और बटन क्लिक करने के बाद यह जाँच सकते हैं कि इनपुट सही है या नहीं।

### फीडबैक संदेश दिखाना

पहले हम लगातार परिणाम दिखाने के लिए `print` का उपयोग कर रहे थे।

`print` की सामग्री केवल कंसोल में दिखाई देती है। डेवलपर इसे Xcode में प्रोग्राम चलाते समय देख सकते हैं, लेकिन सामान्य उपयोगकर्ता फोन पर इन संदेशों को नहीं देख सकते।

इसका मतलब यह है कि, भले ही प्रोग्राम जाँच पूरी कर चुका हो, उपयोगकर्ता को अभी भी यह नहीं पता होता कि दर्ज की गई सामग्री सही है या नहीं।

इस समय, हमें एक ऐसे तरीके की आवश्यकता होती है जो सीधे इंटरफेस पर संदेश दिखा सके।

## Alert चेतावनी बॉक्स

SwiftUI में, हम `Alert` का उपयोग करके एक पॉप-अप संदेश बॉक्स दिखा सकते हैं।

मूल उपयोग:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

यह कोड पिछले कंट्रोल्स की तुलना में थोड़ा अधिक जटिल दिखता है, लेकिन हम इसे भागों में बाँटकर समझ सकते हैं।

`Alert` मुख्य रूप से निम्नलिखित भागों से बना होता है:

- `"Title"`: चेतावनी बॉक्स का शीर्षक
- `isPresented`: एक बाउंड Boolean मान, जिसका उपयोग यह नियंत्रित करने के लिए किया जाता है कि चेतावनी बॉक्स दिखे या नहीं
- `Button(...)`: चेतावनी बॉक्स का बटन
- `message:`: चेतावनी बॉक्स में दिखाया जाने वाला संदेश

इसे सरल रूप से ऐसे समझा जा सकता है: जब बाउंड वेरिएबल `true` हो जाता है, तो सिस्टम यह चेतावनी बॉक्स पॉप अप कर देता है।

दिखाने का प्रभाव:

![alert](../../Resource/020_alert3.png)

संबंधित संरचना:

![alert](../../Resource/020_alert.png)

### Alert एक modifier है

जैसे हमने पहले कई modifiers सीखे थे, वैसे ही `Alert` भी किसी निश्चित व्यू के बाद जोड़ा जाता है।

उदाहरण के लिए, इसे बटन के बाद लगाया जा सकता है:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

इसे बाहरी `VStack` के बाद भी लगाया जा सकता है:

```swift
VStack {
    // ...
}
.alert() {...}
```

अर्थात, `Alert` इंटरफेस में अलग से रखा गया एक स्वतंत्र व्यू नहीं है, बल्कि किसी विशेष व्यू से जुड़ा हुआ एक modifier है।

इसे सरल रूप से ऐसे समझा जा सकता है: `Alert` सामान्यतः बटन या बाहरी layout के बाद लिखा जाता है, ताकि किसी शर्त के पूरा होने पर एक संदेश पॉप अप हो।

### Alert दिखाना

यदि हम `Alert` दिखाना चाहते हैं, तो उसे नियंत्रित करने के लिए एक वेरिएबल चाहिए।

उदाहरण के लिए:

```swift
@State private var showAlert = false
```

यह वेरिएबल `Bool` प्रकार का है, यानी इसमें केवल दो मान होते हैं: `true` या `false`।

फिर इसे `Alert` के `isPresented` से bind किया जाता है:

```swift
isPresented: $showAlert
```

जब `showAlert` `false` होता है, तो चेतावनी बॉक्स दिखाई नहीं देगा; जब `showAlert` `true` होता है, तो चेतावनी बॉक्स पॉप अप होगा।

### बटन के माध्यम से चेतावनी बॉक्स दिखाना

अब, पहले सबसे सरल स्थिति लागू करते हैं:

जब उपयोगकर्ता कुछ भी दर्ज न करे और सीधे `Sign in` बटन पर क्लिक करे, तो एक संदेश बॉक्स पॉप अप हो और उसे बताए: “आपने अभी तक कोई सामग्री दर्ज नहीं की है।”

सबसे पहले, इस संदेश बॉक्स को नियंत्रित करने के लिए एक वेरिएबल बनाइए:

```swift
@State private var showEmpty = false
```

फिर, `Button` के बाद एक `Alert` जोड़िए:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

इसके बाद, बटन क्लिक के कोड में जाँच कीजिए:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

यदि `user` और `password` दोनों खाली हैं, तो हम `showEmpty` को `true` कर देंगे।

और क्योंकि `Alert` इस वेरिएबल से बाउंड है, इसलिए जैसे ही यह `true` होगा, सिस्टम अपने आप चेतावनी बॉक्स दिखा देगा।

दिखाने का प्रभाव:

![alert](../../Resource/020_alert1.png)

इस तरह, उपयोगकर्ता बटन क्लिक करने के बाद तुरंत संदेश देख सकेगा, और डेवलपर को `print` आउटपुट देखने के लिए कंसोल में जाने की आवश्यकता नहीं पड़ेगी।

### बटन और चेतावनी बॉक्स को पूर्ण बनाना

पहले हमने केवल “कुछ भी नहीं भरा गया” वाली स्थिति को संभाला था।

हमें अभी निम्नलिखित स्थितियों को भी संभालना है:

- यूज़रनेम नहीं भरा गया
- पासवर्ड नहीं भरा गया
- यूज़रनेम और पासवर्ड दोनों भरे गए हैं, लेकिन इनपुट गलत है

इसलिए, हमें इन स्थितियों के लिए भी संबंधित संदेश तैयार करने होंगे।

सबसे पहले, तीन नए वेरिएबल जोड़िए:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

फिर बटन के बाद संबंधित `Alert` जोड़ते रहिए:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

इसके बाद, बटन के अंदर निर्णय लॉजिक को पूरा कीजिए:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

जब बटन यह निर्धारित करता है कि उपयोगकर्ता ने कोई जानकारी नहीं भरी, एक जानकारी छोड़ दी, या इनपुट सत्यापन असफल हुआ, तो वह संबंधित Boolean वेरिएबल को `true` में बदल देगा, और फिर संबंधित `Alert` पॉप अप होगा।

यहाँ मैं सुझाव दूँगा कि आप कुछ स्थितियों को स्वयं परीक्षण करें:

- कुछ भी न भरें
- केवल यूज़रनेम भरें
- केवल पासवर्ड भरें
- यूज़रनेम और पासवर्ड दोनों भरें, लेकिन गलत सामग्री के साथ
- यूज़रनेम और पासवर्ड दोनों भरें, और सामग्री सही हो

इससे हम यह सत्यापित कर सकते हैं कि हमारे कोड में कोई समस्या है या नहीं। यह ऐप डेवलपमेंट में बहुत महत्वपूर्ण “testing” चरण भी है।

यदि किसी स्थिति में प्रोग्राम सही व्यवहार नहीं करता, तो इसका अर्थ है कि लॉजिक में समस्या हो सकती है और प्रोग्राम में `Bug` आ गया है।

डेवलपमेंट में जिसे अक्सर `Bug` कहा जाता है, वह त्रुटि, कमी, या ऐसा व्यवहार होता है जो अपेक्षाओं से मेल नहीं खाता।

## लॉगिन व्यू को पूरा करना

पहले बताए गए `Alert` सभी इस बात से संबंधित थे कि “इनपुट गलत होने” पर उपयोगकर्ता को संदेश कैसे दिया जाए।

जब उपयोगकर्ता सही यूज़रनेम और पासवर्ड दर्ज करता है, तो हम सामान्यतः “चेतावनी बॉक्स” पॉप अप नहीं करते, बल्कि सीधे लॉगिन के बाद के इंटरफेस में प्रवेश करते हैं।

यहाँ एक बहुत महत्वपूर्ण अवधारणा शामिल है: **वेरिएबल के मान के अनुसार अलग-अलग व्यू दिखाना।**

उदाहरण के लिए:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

यहाँ हम व्यू के प्रदर्शन को प्रबंधित करने के लिए `Bool` प्रकार का उपयोग करते हैं:

- यदि `login` `true` है, तो इसका अर्थ है कि लॉगिन सफल हो चुका है, और लॉगिन के बाद की सामग्री दिखाई जाती है
- यदि `login` `false` है, तो इसका अर्थ है कि लॉगिन सफल नहीं हुआ, और लॉगिन इंटरफेस दिखता रहता है।

हालाँकि `if` स्टेटमेंट Swift में एक conditional statement है, SwiftUI के `body` के अंदर इसका उपयोग व्यू की display logic को नियंत्रित करने के लिए किया जा सकता है।

अर्थात, SwiftUI शर्त के परिणाम के आधार पर तय करेगा कि इस समय कौन-सा व्यू दिखाया जाना चाहिए।

हम इस display logic को वर्तमान `ContentView` में रख सकते हैं:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

यहाँ, हमने एक नया `login` वेरिएबल जोड़ा है, जिसका उपयोग यह दर्शाने के लिए किया जाता है कि उपयोगकर्ता सफलतापूर्वक लॉगिन हुआ है या नहीं।

फिर, हमने पहले लिखा हुआ लॉगिन व्यू का कोड `else` स्टेटमेंट के बाद रख दिया।

व्यू display logic:

- जब `login` `false` होता है, तो इसका अर्थ है कि लॉगिन अभी सफल नहीं हुआ है, इसलिए मूल लॉगिन व्यू दिखता रहता है।
- जब `login` `true` होता है, तो इसका अर्थ है कि लॉगिन सफल है; इस समय लॉगिन व्यू अब नहीं दिखाया जाता, बल्कि `Login successful` दिखाया जाता है।

अर्थात, `ContentView` `login` के मान के अनुसार अलग-अलग व्यू सामग्री दिखाएगा।

अब, आइए बटन के अंदर लॉगिन सफलता लॉजिक में बदलाव करें:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

जब उपयोगकर्ता द्वारा दर्ज किया गया यूज़रनेम और पासवर्ड दोनों सही हों, तो हम `login` को `true` कर देंगे।

जैसे ही `login` का मान बदलता है, `ContentView` के अंदर `if` जाँच का परिणाम भी बदल जाता है, और इंटरफेस मूल लॉगिन व्यू से `Login successful` में बदल जाता है।

दिखाने का प्रभाव इस प्रकार है:

![view](../../Resource/020_view.png)

अब हमने वास्तव में “शर्तों के आधार पर अलग-अलग व्यू दिखाने” वाले ज्ञान को इस वर्तमान लॉगिन पेज में लागू कर दिया है।

वास्तविक ऐप्स में भी सामान्यतः यही तरीका इस्तेमाल होता है: किसी निश्चित मान के आधार पर अलग-अलग व्यू दिखाए जाते हैं।

उदाहरण के लिए, जब उपयोगकर्ता लॉगिन नहीं होता, तो लॉगिन पेज दिखता है; और जब उपयोगकर्ता सफलतापूर्वक लॉगिन कर लेता है, तो दूसरा इंटरफेस दिखता है।

मुख्य विचार यह है: **वेरिएबल्स के परिवर्तन के माध्यम से नियंत्रित करना कि इंटरफेस में कौन-सी सामग्री दिखाई जाए।**

## सारांश

इस पाठ में, हमने तीन महत्वपूर्ण बातें सीखी:

1. पासवर्ड दर्ज करने के लिए `SecureField` का उपयोग करना, ताकि पासवर्ड की सामग्री सीधे इंटरफेस पर दिखाई न दे।
2. केवल कंसोल में आउटपुट दिखाने के बजाय, उपयोगकर्ता को संदेश दिखाने के लिए `Alert` का उपयोग करना।
3. अलग-अलग व्यू के प्रदर्शन को नियंत्रित करने और लॉगिन से पहले तथा बाद के इंटरफेस के बीच स्विच लागू करने के लिए वेरिएबल्स और `if` शर्तों का उपयोग करना।

इस ज्ञान को सीखकर, अब हम बुनियादी इंटरैक्शन प्रभावों वाला एक लॉगिन व्यू पूरा कर सकते हैं, और SwiftUI की इस डेवलपमेंट सोच को बेहतर समझ सकते हैं: “state बदलती है, तो interface अपडेट होता है।”

## पूरा कोड

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
            VStack {
                Image("019_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                Text("Sign in to App")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("Username")
                        .fontWeight(.bold)
                    TextField("input user", text: $user)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                HStack {
                    Text("Password")
                        .fontWeight(.bold)
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## विस्तृत ज्ञान - कई बटन वाला Alert

इस पाठ के पहले वाले भाग में, हमने सबसे बुनियादी `Alert` का उपयोग किया था, जिसमें केवल एक बटन था और जिसका मुख्य उपयोग उपयोगकर्ता को संकेत देने के लिए था।

वास्तव में, `Alert` में कई बटन भी हो सकते हैं, ताकि उपयोगकर्ता अलग-अलग विकल्प चुन सके।

उदाहरण के लिए:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

बटन पर क्लिक करने के बाद, तीन विकल्पों वाला एक संदेश बॉक्स पॉप अप होगा: `Ok`, `delete`, और `cancel`।

दिखाने का प्रभाव:

![alert](../../Resource/020_alert2.png)

अलग-अलग बटन पर क्लिक करने से संबंधित कोड चलाया जाएगा।

### Button की `role` property

यहाँ आप देखेंगे कि `Alert` के अंदर का `Button`, हमने पहले सीखे सामान्य बटन के syntax से थोड़ा अलग है:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

यहाँ एक अतिरिक्त `role` parameter है।

SwiftUI में, `role` का उपयोग सिस्टम को यह बताने के लिए किया जाता है कि यह बटन किस प्रकार की क्रिया का प्रतिनिधित्व करता है।

कुछ सामान्य roles इस प्रकार हैं:

- `.cancel`: रद्द करने की क्रिया
- `.destructive`: खतरनाक क्रिया, जैसे delete
- `nil`: सामान्य क्रिया

अलग-अलग `role` मान आमतौर पर इंटरफेस में अलग-अलग visual styles भी लाते हैं।

उदाहरण के लिए, खतरनाक क्रियाएँ अक्सर अधिक ध्यान आकर्षित करने वाली शैली में दिखाई जाती हैं, ताकि उपयोगकर्ता को सावधानी से क्लिक करने की याद दिलाई जा सके।

इसके अलावा, `role` बटन के लिए अतिरिक्त semantic information भी प्रदान करता है, जिससे screen readers (जैसे Apple devices पर VoiceOver) उपयोगकर्ता को बटन का उद्देश्य समझाने में मदद कर सकते हैं।

इसलिए, उपयुक्त परिस्थितियों में किसी बटन में `role` जोड़ना एक बहुत अच्छी आदत है।
