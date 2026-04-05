# लॉगिन परस्परसंवाद

मागील धड्यात, आपण एक लॉगिन व्ह्यू तयार केला आणि बटणे व निर्णय-लॉजिकच्या मदतीने इनपुट सामग्रीची साधी पडताळणी लागू केली.

या धड्यात, आपण मागील धड्याच्या कोडच्या आधारावर `SecureField` पासवर्ड इनपुट बॉक्स, `Alert` चेतावणी बॉक्स, आणि व्हेरिएबल्सनुसार वेगवेगळे व्ह्यू कसे दाखवायचे हे शिकणार आहोत.

या धड्याद्वारे, तुम्ही लॉगिन व्ह्यूच्या मूलभूत परस्परसंवादाच्या प्रवाहाला अधिक चांगल्या प्रकारे समजू शकता. हे अनेक अॅप्समध्ये वापरले जाणारे मूलभूत लॉजिकही आहे.

## पासवर्ड इनपुट बॉक्स

मागील धड्यात, आपण पासवर्ड टाकण्यासाठी `TextField` वापरले.

पण प्रत्यक्ष लॉगिन इंटरफेसमध्ये, पासवर्ड साधारणपणे थेट दिसत नाही; त्याऐवजी तो ठिपके किंवा इतर लपवलेल्या प्रभावात दाखवला जातो, ज्यामुळे वापरकर्त्याची गोपनीयता सुरक्षित राहते.

SwiftUI मध्ये, पासवर्ड टाकण्यासाठी खास वापरला जाणारा कंट्रोल `SecureField` आहे.

उदाहरणार्थ:

```swift
SecureField("Password", text: $password)
```

याची लिखाणशैली `TextField` सारखीच आहे. यालाही एक संकेत मजकूर आणि एक बाउंड व्हेरिएबल आवश्यक असते.

हे साध्या भाषेत असे समजू शकतो: `SecureField` सुद्धा एक इनपुट बॉक्स आहे, फक्त तो टाकलेली सामग्री लपवतो.

पूर्वी पासवर्ड टाकण्यासाठी वापरलेला `TextField` आपण थेट `SecureField` मध्ये बदलू शकतो:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

जेव्हा वापरकर्ता पासवर्ड टाकतो, तेव्हा पासवर्डची सामग्री इंटरफेसवर थेट दिसणार नाही.

दाखवण्याचा परिणाम:

![password](../../Resource/020_password.png)

आता आपण यूजरनेम आणि पासवर्ड टाकू शकतो, आणि बटण क्लिक केल्यानंतर इनपुट योग्य आहे की नाही हे ठरवू शकतो.

### फीडबॅक संदेश दाखवणे

याआधी आपण निकाल दाखवण्यासाठी सतत `print` वापरत होतो.

`print` ची सामग्री फक्त कन्सोलमध्ये दिसते. डेव्हलपर Xcode मध्ये प्रोग्राम चालवताना ती पाहू शकतात, पण सामान्य वापरकर्ते फोनवर हे संदेश पाहू शकत नाहीत.

याचा अर्थ असा की, प्रोग्रामने तपासणी पूर्ण केली असली तरी वापरकर्त्याला टाकलेली सामग्री योग्य आहे की नाही हे कळत नाही.

या वेळी, आपल्याला असा मार्ग हवा जो थेट इंटरफेसवर संदेश दाखवू शकेल.

## Alert चेतावणी बॉक्स

SwiftUI मध्ये, आपण `Alert` वापरून एक पॉप-अप संदेश बॉक्स दाखवू शकतो.

मूलभूत वापर:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

हा कोड मागील कंट्रोल्सपेक्षा थोडा अधिक गुंतागुंतीचा दिसतो, पण आपण तो भागांमध्ये विभागून समजू शकतो.

`Alert` मध्ये मुख्यत्वे खालील भाग असतात:

- `"Title"`: चेतावणी बॉक्सचे शीर्षक
- `isPresented`: चेतावणी बॉक्स दाखवायचा की नाही हे नियंत्रित करणारी बाउंड Boolean value
- `Button(...)`: चेतावणी बॉक्समधील बटण
- `message:`: चेतावणी बॉक्समध्ये दाखवला जाणारा संदेश

हे साध्या शब्दांत असे समजू शकतो: बाउंड व्हेरिएबल `true` झाले की, सिस्टम हा चेतावणी बॉक्स पॉप अप करते.

दाखवण्याचा परिणाम:

![alert](../../Resource/020_alert3.png)

संबंधित रचना:

![alert](../../Resource/020_alert.png)

### Alert हा modifier आहे

आपण आधी शिकलो त्याप्रमाणे, `Alert` सुद्धा एखाद्या विशिष्ट व्ह्यूनंतर जोडला जातो.

उदाहरणार्थ, तो बटणानंतर जोडता येतो:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

तो बाहेरील `VStack` नंतरही जोडता येतो:

```swift
VStack {
    // ...
}
.alert() {...}
```

म्हणजेच, `Alert` हा इंटरफेसमध्ये वेगळा ठेवलेला स्वतंत्र व्ह्यू नाही; तो एखाद्या विशिष्ट व्ह्यूला जोडलेला modifier आहे.

हे साधेपणाने असे समजू शकतो: `Alert` सहसा बटण किंवा बाहेरील layout नंतर लिहिला जातो, जेणेकरून एखादी अट पूर्ण झाल्यावर संदेश पॉप अप होईल.

### Alert दाखवणे

जर आपल्याला `Alert` दाखवायचा असेल, तर त्याला नियंत्रित करण्यासाठी एक व्हेरिएबल लागतो.

उदाहरणार्थ:

```swift
@State private var showAlert = false
```

हा व्हेरिएबल `Bool` प्रकाराचा आहे, म्हणजे त्याला फक्त दोन मूल्ये असतात: `true` किंवा `false`.

त्यानंतर हा `Alert` च्या `isPresented` ला bind केला जातो:

```swift
isPresented: $showAlert
```

`showAlert` `false` असताना, चेतावणी बॉक्स दिसणार नाही; `showAlert` `true` असताना, चेतावणी बॉक्स पॉप अप होईल.

### बटणाद्वारे चेतावणी बॉक्स दाखवणे

आता, आधी सर्वात सोपी परिस्थिती लागू करूया:

जेव्हा वापरकर्ता काहीच भरत नाही आणि थेट `Sign in` बटण क्लिक करतो, तेव्हा “तुम्ही अजून काहीही माहिती भरलेली नाही” असे सांगणारा एक संदेश बॉक्स पॉप अप होईल.

सर्वप्रथम, हा संदेश बॉक्स नियंत्रित करण्यासाठी एक व्हेरिएबल तयार करा:

```swift
@State private var showEmpty = false
```

नंतर, `Button` नंतर `Alert` जोडा:

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

यानंतर, बटण क्लिक कोडमध्ये अट तपासा:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

जर `user` आणि `password` दोन्ही रिकामे असतील, तर आपण `showEmpty` ला `true` करू.

आणि `Alert` हा या व्हेरिएबलला bind केलेला असल्याने, तो `true` झाल्यावर सिस्टम आपोआप चेतावणी बॉक्स दाखवेल.

दाखवण्याचा परिणाम:

![alert](../../Resource/020_alert1.png)

अशा प्रकारे, वापरकर्ता बटण क्लिक केल्यानंतर लगेचच संदेश पाहू शकतो, आणि डेव्हलपरला `print` output पाहण्यासाठी कन्सोलमध्ये जाण्याची गरज उरणार नाही.

### बटण आणि चेतावणी बॉक्स अधिक पूर्ण करणे

यापूर्वी आपण फक्त “काहीही भरलेले नाही” ही परिस्थिती हाताळली होती.

आता आपल्याला खालील परिस्थिती देखील हाताळायच्या आहेत:

- यूजरनेम भरलेला नाही
- पासवर्ड भरलेला नाही
- यूजरनेम आणि पासवर्ड दोन्ही भरलेले आहेत, पण इनपुट चुकीचा आहे

म्हणून, या परिस्थितींसाठी आपल्याला संबंधित संदेशही तयार करावे लागतील.

सर्वप्रथम, तीन नवीन व्हेरिएबल्स जोडा:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

यानंतर बटणानंतर संबंधित `Alert` जोडत राहा:

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

यानंतर, बटणाच्या आतला निर्णय-लॉजिक पूर्ण करा:

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

जेव्हा बटण ठरवते की वापरकर्त्याने कोणतीही माहिती भरलेली नाही, एखादी माहिती टाकायची राहिली आहे, किंवा इनपुट पडताळणी अयशस्वी झाली आहे, तेव्हा ते संबंधित Boolean व्हेरिएबलला `true` मध्ये बदलते, आणि नंतर संबंधित `Alert` पॉप अप होतो.

इथे मी सुचवेन की तुम्ही काही परिस्थिती स्वतः तपासा:

- काहीही भरू नका
- फक्त यूजरनेम भरा
- फक्त पासवर्ड भरा
- यूजरनेम आणि पासवर्ड दोन्ही भरा, पण चुकीच्या मजकुरासह
- यूजरनेम आणि पासवर्ड दोन्ही भरा, आणि मजकूर योग्य ठेवा

यामुळे आपल्या कोडमध्ये काही समस्या आहे का ते पडताळता येईल. हे अॅप डेव्हलपमेंटमधील अतिशय महत्त्वाचे “testing” पाऊल आहे.

जर एखाद्या परिस्थितीत प्रोग्राम योग्य वागला नाही, तर याचा अर्थ लॉजिकमध्ये काही समस्या असू शकते आणि प्रोग्राममध्ये `Bug` आला आहे.

डेव्हलपमेंटमध्ये आपण ज्या गोष्टीला `Bug` म्हणतो, ती म्हणजे त्रुटी, उणीव, किंवा अपेक्षेप्रमाणे नसलेले वर्तन.

## लॉगिन व्ह्यू पूर्ण करणे

आधी सांगितलेले `Alert` हे सर्व “इनपुट चुकीचा असताना” वापरकर्त्याला संदेश कसा द्यावा याबद्दल होते.

जेव्हा वापरकर्ता योग्य यूजरनेम आणि पासवर्ड टाकतो, तेव्हा आपण साधारणपणे “चेतावणी बॉक्स” पॉप अप करत नाही; त्याऐवजी थेट लॉगिननंतरच्या इंटरफेसमध्ये प्रवेश करतो.

इथे एक अत्यंत महत्त्वाची संकल्पना आहे: **व्हेरिएबलच्या मूल्यावर आधारित वेगवेगळे व्ह्यू दाखवणे.**

उदाहरणार्थ:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

इथे, आपण व्ह्यू प्रदर्शन नियंत्रित करण्यासाठी `Bool` प्रकार वापरतो:

- जर `login` `true` असेल, तर याचा अर्थ लॉगिन यशस्वी झाले आहे, आणि लॉगिननंतरची सामग्री दाखवली जाते
- जर `login` `false` असेल, तर याचा अर्थ लॉगिन यशस्वी झालेले नाही, आणि लॉगिन इंटरफेस पुढेही दाखवला जातो.

`if` स्टेटमेंट Swift मधील conditional statement असले तरी, SwiftUI च्या `body` मध्ये ते व्ह्यू प्रदर्शन लॉजिक नियंत्रित करण्यासाठी वापरले जाऊ शकते.

म्हणजेच, SwiftUI या अटीच्या निकालानुसार सध्या कोणता व्ह्यू दाखवायचा हे ठरवते.

आपण ही प्रदर्शन-लॉजिक सध्याच्या `ContentView` मध्ये ठेवू शकतो:

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

इथे आपण `login` नावाचा एक नवीन व्हेरिएबल जोडला आहे, जो वापरकर्ता यशस्वीपणे लॉगिन झाला आहे का हे दर्शवतो.

नंतर, आपण आधी लिहिलेला लॉगिन व्ह्यूचा कोड `else` स्टेटमेंटच्या मागे ठेवला.

व्ह्यू प्रदर्शन लॉजिक:

- `login` `false` असताना, याचा अर्थ अजून लॉगिन यशस्वी झालेले नाही, त्यामुळे मूळ लॉगिन व्ह्यू पुढेही दाखवला जातो.
- `login` `true` असताना, याचा अर्थ लॉगिन यशस्वी झाले आहे; या वेळी लॉगिन व्ह्यू पुढे दाखवला जात नाही, आणि त्याऐवजी `Login successful` दाखवले जाते.

म्हणजेच, `ContentView` `login` च्या मूल्यावर आधारित वेगवेगळी व्ह्यू सामग्री दाखवेल.

आता, बटणातील लॉगिन यशाच्या लॉजिकमध्ये बदल करूया:

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

जेव्हा वापरकर्त्याने टाकलेला यूजरनेम आणि पासवर्ड दोन्ही योग्य असतील, तेव्हा आपण `login` ला `true` करू.

एकदा `login` चे मूल्य बदलले की, `ContentView` मधील `if` तपासणीचा निकालही बदलतो, आणि इंटरफेस मूळ लॉगिन व्ह्यूवरून `Login successful` मध्ये बदलतो.

दाखवण्याचा परिणाम खालीलप्रमाणे आहे:

![view](../../Resource/020_view.png)

आता आपण “अटींनुसार वेगवेगळे व्ह्यू दाखवणे” या ज्ञानाचा खऱ्या अर्थाने या सध्याच्या लॉगिन पानात वापर केला आहे.

प्रत्यक्ष अॅप्समध्येही साधारणपणे हेच पद्धत वापरली जाते: विशिष्ट मूल्याच्या आधारे वेगवेगळे व्ह्यू दाखवले जातात.

उदाहरणार्थ, वापरकर्ता लॉगिन नसताना लॉगिन पान दाखवले जाते; आणि वापरकर्ता यशस्वीपणे लॉगिन केल्यानंतर दुसरा इंटरफेस दाखवला जातो.

मुख्य कल्पना अशी आहे: **व्हेरिएबल्समधील बदलांद्वारे इंटरफेसमध्ये कोणती सामग्री दाखवायची हे नियंत्रित करणे.**

## सारांश

या धड्यात, आपण तीन महत्त्वाच्या गोष्टी शिकलो:

1. पासवर्ड टाकण्यासाठी `SecureField` वापरणे, ज्यामुळे पासवर्डची सामग्री थेट इंटरफेसवर दिसणार नाही.
2. फक्त कन्सोलमध्ये output दाखवण्याऐवजी, वापरकर्त्याला संदेश दाखवण्यासाठी `Alert` वापरणे.
3. वेगवेगळ्या व्ह्यूंचे प्रदर्शन नियंत्रित करण्यासाठी आणि लॉगिनपूर्व व लॉगिननंतरच्या इंटरफेसमध्ये स्विच लागू करण्यासाठी व्हेरिएबल्स व `if` अटी वापरणे.

या ज्ञानामुळे, आता आपण मूलभूत परस्परसंवाद परिणाम असलेला लॉगिन व्ह्यू पूर्ण करू शकतो, आणि SwiftUI मधील “state बदलते, interface अपडेट होते” ही डेव्हलपमेंट संकल्पना अधिक चांगल्या प्रकारे समजू शकतो.

## पूर्ण कोड

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

## विस्तारित ज्ञान - अनेक बटणांचा Alert

या धड्याच्या आधीच्या भागात, आपण सर्वात मूलभूत `Alert` वापरला, ज्यात फक्त एकच बटण होते आणि जो मुख्यतः वापरकर्त्याला सूचना देण्यासाठी वापरला जात होता.

प्रत्यक्षात, `Alert` मध्ये अनेक बटणेही असू शकतात, ज्यामुळे वापरकर्ता वेगवेगळे पर्याय निवडू शकतो.

उदाहरणार्थ:

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

बटण क्लिक केल्यानंतर, `Ok`, `delete`, आणि `cancel` हे तीन पर्याय असलेला संदेश बॉक्स पॉप अप होतो.

दाखवण्याचा परिणाम:

![alert](../../Resource/020_alert2.png)

वेगवेगळ्या बटणांवर क्लिक केल्यास संबंधित कोड चालवला जाईल.

### Button ची `role` property

इथे तुम्ही पाहाल की `Alert` मधील `Button`, आपण आधी शिकलेल्या सामान्य बटणाच्या syntax पेक्षा थोडा वेगळा आहे:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

इथे अतिरिक्त `role` parameter आहे.

SwiftUI मध्ये, `role` चा वापर सिस्टमला हे सांगण्यासाठी केला जातो की हे बटण कोणत्या प्रकारच्या कृतीचे प्रतिनिधित्व करते.

काही सामान्य roles असे आहेत:

- `.cancel`: रद्द करण्याची कृती
- `.destructive`: धोकादायक कृती, जसे delete
- `nil`: सामान्य कृती

वेगवेगळे `role` values सहसा इंटरफेसमध्ये वेगवेगळे visual styles देखील आणतात.

उदाहरणार्थ, धोकादायक कृती बहुतेक वेळा अधिक लक्ष वेधून घेणाऱ्या शैलीत दाखवल्या जातात, ज्यामुळे वापरकर्त्याला काळजीपूर्वक क्लिक करण्याची आठवण होते.

याशिवाय, `role` बटणासाठी अतिरिक्त semantic माहितीही देते, ज्यामुळे screen readers (उदाहरणार्थ Apple devices वरील VoiceOver) वापरकर्त्याला बटणाचा हेतू समजावून सांगणे अधिक सोपे होते.

म्हणून, योग्य परिस्थितीत बटणाला `role` जोडणे ही एक अतिशय चांगली सवय आहे.
