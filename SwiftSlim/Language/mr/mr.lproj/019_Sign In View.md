# साइन-इन व्ह्यू

या धड्यात, आपण एक अतिशय उपयोगी दृश्य शिकणार आहोत, म्हणजे साइन-इन व्ह्यू.

वेबसाइट असो किंवा अॅप, वापरताना अनेकदा वापरकर्त्याला आपल्या खात्यात साइन-इन करून पासवर्ड टाकावा लागतो.

उदाहरणार्थ, GitHub चे साइन-इन पेज:

![WordPress](../../Resource/019_github.png)

या धड्यात, आपण अशाच प्रकारचा साइन-इन व्ह्यू तयार करू, ज्यात वापरकर्ता स्वतः अकाउंट आणि पासवर्ड भरू शकेल, आणि आपण भरलेल्या मजकुरात काही समस्या आहे का ते तपासू शकू.

## वरचा लेआउट

आपण `ContentView` फाइलमध्ये साइन-इन व्ह्यूचा कोड लिहिणार आहोत.

सुरुवातीला, साइन-इन व्ह्यूच्या वरच्या भागातील ओळख दर्शवणारा विभाग तयार करूया. तुम्ही आधी योग्य आयकॉन इमेज तयार करून ती `Assets` फोल्डरमध्ये ठेवू शकता.

![icon](../../Resource/019_icon1.png)

त्यानंतर, इमेज दाखवण्यासाठी `Image` आणि modifiers वापरा:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

या modifiers चा अर्थ असा आहे:

- `resizable()`: इमेजचा आकार बदलता येतो.
- `scaledToFit()`: इमेजचा मूळ अनुपात जपून स्केल करते.
- `frame(width: 100)`: इमेजची दाखवली जाणारी रुंदी `100` वर सेट करते.

पुढे, साइन-इन शीर्षक दाखवण्यासाठी `Text` आणि modifiers वापरा:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

त्यानंतर, `VStack` वापरून इमेज आणि मजकूर वर-खाली मांडूया:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

परिणाम:

![view](../../Resource/019_view.png)

इथपर्यंत आपण साइन-इन व्ह्यूच्या वरच्या शीर्षक विभागाचे काम पूर्ण केले आहे.

### लेआउट ऑप्टिमाइझ करणे

आत्ता इमेज आणि शीर्षक हे डिफॉल्टपणे संपूर्ण लेआउटच्या मध्यभागी आहेत.

जर आपल्याला ते अधिक “पेजच्या वरच्या साइन-इन ओळखी” सारखे दिसावे असे वाटत असेल, तर आपण `Spacer()` वापरून उरलेली जागा पसरवू शकतो, ज्यामुळे कंटेंट वरच्या बाजूला जवळ दिसेल.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

परिणाम:

![view](../../Resource/019_view1.png)

पण आता `Image` आणि `Text` स्क्रीनच्या वरच्या भागाच्या खूप जवळ गेले आहेत, त्यामुळे ते थोडे गच्च वाटते.

या वेळी, आपण संपूर्ण `VStack` ला वरची जागा देण्यासाठी `padding` वापरू शकतो.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

परिणाम:

![view](../../Resource/019_view2.png)

अशा प्रकारे, पेजच्या वरचा शीर्षक विभाग अधिक योग्य दिसतो.

## वापरकर्ता नाव आणि पासवर्ड

साइन-इन पेजवर सामान्यतः वापरकर्त्याने वापरकर्ता नाव आणि पासवर्ड भरावा लागतो.

SwiftUI मध्ये, वापरकर्त्याने भरलेला मजकूर स्वीकारण्यासाठी आपण `TextField` वापरू शकतो.

पण एक गोष्ट लक्षात ठेवावी लागेल: `TextField` स्वतः इनपुट डेटा दीर्घकाळ साठवत नाही, तो फक्त एक इनपुट कंट्रोल आहे. हा इनपुट मजकूर प्रत्यक्षात साठवणारे म्हणजे आपण त्याला bind केलेले variables आहेत.

म्हणून, सर्वप्रथम वापरकर्ता नाव आणि पासवर्ड साठवण्यासाठी दोन `@State` variables तयार करणे आवश्यक आहे:

```swift
@State private var user = ""
@State private var password = ""
```

`@State` variable चे value बदलले की SwiftUI संबंधित views आपोआप refresh करते.

त्यानंतर, ही दोन्ही variables bind करण्यासाठी `TextField` वापरा:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

इथे `$user` आणि `$password` याचा अर्थ “binding” आहे.

म्हणजेच, वापरकर्ता इनपुट बॉक्समध्ये टेक्स्ट लिहितो तेव्हा variable चे value त्याच वेळी बदलते; आणि variable बदलले की इनपुट बॉक्समध्ये दिसणारा मजकूरही त्याच वेळी बदलतो.

व्ह्यू आणि डेटा “एकमेकांशी सिंक राहतात” या संबंधाला binding म्हणतात.

इथे `$` असलेली हीच लिहिण्याची पद्धत वापरावी लागते, हे लक्षात ठेवा:

```swift
$user
```

कारण `TextField` ला सामान्य string नको असते, तर “दोन्ही दिशांनी डेटा बदलू शकणारे” binding value हवे असते.

### इनपुट बॉक्स दाखवणे

चला, हे `ContentView` मध्ये ठेवूया:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

दाखवण्याचा परिणाम:

![view](../../Resource/019_view3.png)

कारण आत्ता `user` आणि `password` ही दोन्ही डिफॉल्टपणे रिकामी strings आहेत:

```swift
""
```

म्हणून इनपुट बॉक्समध्ये आधी placeholder मजकूर दिसेल, उदाहरणार्थ:

```swift
input user
```

हा मजकूर फक्त वापरकर्त्याला “इथे काय भरायचे” हे सांगतो, हा खरा भरलेला मजकूर नाही.

### इनपुट बॉक्स ऑप्टिमाइझ करणे

आता इनपुट बॉक्स वापरता येतात, पण डिफॉल्ट शैली तुलनेने साधी आहे.

इंटरफेस अधिक स्पष्ट दिसण्यासाठी, आपण इनपुट बॉक्सच्या आधी एक शीर्षक जोडू शकतो, आणि इनपुट बॉक्सवर थोडे साधे शैली-सुधार करू शकतो.

उदाहरणार्थ, आधी एक शीर्षक जोडा:

```swift
Text("Username")
    .fontWeight(.bold)
```

त्यानंतर, `HStack` वापरून शीर्षक आणि इनपुट बॉक्स एकाच ओळीत ठेवा:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

इथे आपण `HStack` वापरतो कारण आपल्याला “डावीकडे शीर्षक आणि उजवीकडे इनपुट बॉक्स” दाखवायचा आहे.

एक गोष्ट लक्षात ठेवण्यासारखी आहे की `TextField` डिफॉल्टपणे उरलेली मोकळी जागा व्यापते.

![color](../../Resource/019_view6.png)

दोन्ही इनपुट बॉक्सचा आकार अधिक एकसमान दिसावा म्हणून, आपण `frame(width:)` वापरून त्याची रुंदी ठरवू शकतो, त्यामुळे इनपुट बॉक्स अधिक नीटनेटके दिसतील.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

यानंतर, इनपुट बॉक्स अधिक स्पष्ट दिसण्यासाठी border सुद्धा जोडा:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

आता, वापरकर्ता नाव आणि पासवर्ड दोन्ही `ContentView` व्ह्यूमध्ये जोडूया:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
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
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

दाखवण्याचा परिणाम:

![view](../../Resource/019_view4.png)

इथपर्यंत, वापरकर्ता आता वापरकर्ता नाव आणि पासवर्ड भरू शकतो.

## साइन-इन बटण

पुढे, आपण इनपुट बॉक्सच्या खाली एक साइन-इन बटण जोडू.

```swift
Button("Sign in") {

}
```

त्यानंतर, `buttonStyle` वापरून बटणाला अधिक स्पष्ट system style द्या:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

दाखवण्याचा परिणाम:

![view](../../Resource/019_view5.png)

बटण खरोखर टॅपला प्रतिसाद देते का हे तपासण्यासाठी, आपण आधी चाचणी म्हणून बटणाच्या आत `print` लिहू शकतो:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

बटणावर टॅप केल्यावर, console मध्ये हे output होईल:

```swift
click Sign in
```

यातून दिसते की बटणाने यशस्वीपणे टॅप action ला प्रतिसाद दिला आहे.

## साइन-इन लॉजिक

आता, आपण साइन-इन बटणात सर्वात मूलभूत validation logic जोडू: **वापरकर्त्याने वापरकर्ता नाव आणि पासवर्ड भरले आहेत का हे तपासणे**.

आपल्याला खालील परिस्थिती साध्य करायच्या आहेत:

- जर वापरकर्त्याने काहीही भरले नसेल, तर `Empty` output करा
- जर वापरकर्त्याने दोघांपैकी फक्त एकच भरले असेल, तर काय missing आहे ते सांगा
- जर वापरकर्ता नाव आणि पासवर्ड दोन्ही भरले असतील, तर `Success` output करा

### कोणतीही माहिती भरलेली नाही

कारण `user` आणि `password` ही दोन्ही डिफॉल्टपणे रिकामी strings आहेत:

```swift
@State private var user = ""
@State private var password = ""
```

म्हणून जेव्हा वापरकर्ता काहीही भरत नाही, तेव्हा ती अजूनही रिकामीच राहतात.

Swift मध्ये, `String` सारखे types `isEmpty` वापरून content रिकामे आहे का नाही ते ठरवू शकतात.

### isEmpty property

`isEmpty` सामान्यतः strings, arrays आणि इतर content रिकामे आहे का हे तपासण्यासाठी वापरली जाते.

उदाहरणार्थ:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

जर content रिकामे असेल, तर `isEmpty` `true` return करते; आणि content रिकामे नसेल, तर `false` return करते.

म्हणून, वापरकर्ता नाव आणि पासवर्डमध्ये input content आहे का नाही हे ठरवण्यासाठी आपण याचा वापर करू शकतो.

### isEmpty वापरून variables तपासणे

जर वापरकर्त्याने कोणतीही माहिती भरली नसेल, तर:

```swift
user.isEmpty // true
password.isEmpty    // true
```

या वेळी, आपण condition अशी लिहू शकतो:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

या कोडचा अर्थ असा: जर `user` रिकामे असेल, आणि `password` सुद्धा रिकामे असेल, तर हे output करा:

```swift
Empty
```

इथे `&&` हा एक logical operator आहे, ज्याचा अर्थ “आणि” असा होतो.

म्हणजेच, डाव्या बाजूची condition true आणि उजव्या बाजूची condition सुद्धा true असली तरच पूर्ण condition true होते.

म्हणून, हा कोड तेव्हाच चालेल जेव्हा वापरकर्ता नाव आणि पासवर्ड दोन्ही रिकामे असतील.

## वापरकर्त्याने फक्त काही भाग भरला

यानंतर, दुसरी एक परिस्थिती विचारात घेऊया: वापरकर्त्याने फक्त वापरकर्ता नाव भरले आहे, किंवा फक्त पासवर्ड भरला आहे.

उदाहरणार्थ:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

या वेळी, वापरकर्ता नाव रिकामे नाही, पण पासवर्ड रिकामे आहे.

हे तपासण्यासाठी आपण `isEmpty` वापरत राहू शकतो:

### वापरकर्त्याने account किंवा password भरलेल्या परिस्थिती

जर वापरकर्त्याने फक्त वापरकर्ता नाव किंवा फक्त पासवर्ड भरला असेल, तर काय कमी आहे हे सांगणारा योग्य इशारा द्यावा लागेल.

उदाहरणार्थ, जर वापरकर्त्याने फक्त वापरकर्ता नाव भरले असेल:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

या कोडची logic अशी आहे: जर वापरकर्ता नाव रिकामे असेल, तर वापरकर्ता नाव भरायला सांगा. अन्यथा, पासवर्ड रिकामा आहे का ते तपासा, आणि रिकामा असेल तर पासवर्ड भरायला सांगा.

### वापरकर्त्याने सर्व माहिती भरली

जर वापरकर्ता नाव आणि पासवर्ड दोन्ही आधीच भरलेले असतील, तर `isEmpty` दोघांसाठी `false` return करेल.

या वेळी, आपण ते असे लिहू शकतो:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

इथे `!` चा अर्थ “negation” असा होतो.

उदाहरणार्थ:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

म्हणजे, `user.isEmpty` चा वापर “वापरकर्ता नाव रिकामे आहे का” हे ठरवण्यासाठी केला जातो, आणि `!user.isEmpty` चा वापर “वापरकर्ता नाव रिकामे नाही का” हे ठरवण्यासाठी केला जातो.

पासवर्डलाही हाच logic लागू होतो.

म्हणून, या कोडचा अर्थ असा आहे: वापरकर्ता नाव रिकामे नाही, आणि पासवर्डही रिकामे नाही.

जेव्हा ही दोन्ही conditions true असतात, तेव्हा output असेल:

```swift
Success
```

## पूर्ण validation logic

आता, या तीनही परिस्थिती एकत्र करून `Button` मध्ये लिहूया:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

या कोडचा execution order असा समजू शकतो:

पहिल्या टप्प्यात, आधी आपण हे तपासतो:

```swift
if user.isEmpty && password.isEmpty
```

जर वापरकर्ता नाव आणि पासवर्ड दोन्ही रिकामे असतील, तर थेट `Empty` output होईल.

जर दोन्ही रिकामे नसतील, तर आपण ही ओळ तपासणे पुढे चालू ठेवतो:

```swift
else if user.isEmpty || password.isEmpty
```

इथे `||` चा अर्थ “किंवा” असा होतो.

म्हणजे, एक condition true असली तरी पूर्ण condition true होते.

म्हणून, जोपर्यंत वापरकर्ता नाव रिकामे आहे किंवा पासवर्ड रिकामे आहे, तोपर्यंत `else if` चा code block चालेल.

Code block मध्ये गेल्यानंतर, कोणता input box भरला गेला नाही हे आपण अजून स्पष्टपणे तपासतो:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

जर वरच्या दोन conditions पैकी एकही true नसेल, तर याचा अर्थ वापरकर्ता नाव रिकामे नाही आणि पासवर्डही रिकामे नाही.

मग program शेवटच्या `else` मध्ये जाईल:

```swift
print("Success")
```

अशा प्रकारे, आपण साइन-इन input साठीची सर्वात मूलभूत validation logic पूर्ण करतो.

## वापरकर्ता नाव आणि पासवर्ड validation

वरील logic फक्त “काही content भरले गेले आहे का नाही” हेच तपासते.

पण खऱ्या अॅपमध्ये फक्त content भरून चालत नाही. सामान्यतः, वापरकर्ता नाव आणि पासवर्ड verify करण्यासाठी server कडे पाठवावे लागतात.

Server ने वापरकर्ता नाव अस्तित्वात आहे आणि पासवर्ड बरोबर आहे याची खात्री केली, तर तो sign in ला परवानगी देईल; नाहीतर sign in अयशस्वी झाल्याचे सांगेल.

या प्रक्रियेचा सराव करण्यासाठी, आपण आधी code मध्ये एक temporary account आणि password सेट करून “योग्य sign in माहिती”चे अनुकरण करू शकतो:

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

जेव्हा वापरकर्ता नाव आणि पासवर्ड दोन्ही रिकामे नसतात, तेव्हा आपण पुढे ते बरोबर आहेत का हे तुलना करतो:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

इथे `==` चा अर्थ “समान आहे का” असा होतो.

उदाहरणार्थ:

```swift
user == userID
```

याचा अर्थ, वापरकर्त्याने भरलेले वापरकर्ता नाव आपण सेट केलेल्या योग्य वापरकर्ता नावाशी पूर्णपणे जुळते का? पासवर्डची तपासणीही याच logic नुसार चालते.

म्हणून, भरलेले वापरकर्ता नाव आणि पासवर्ड सेट केलेल्या values शी जुळले तर `Success` output होईल; त्यापैकी एक जरी जुळला नाही, तर `Input error` output होईल.

अशा प्रकारे, आपण एक सोपी “mock sign in verification” पूर्ण करतो.

हे अजूनही server शी जोडलेले खरे sign in feature नसले, तरी एक गोष्ट समजण्यासाठी ते पुरेसे आहे: **बटणावर टॅप केल्यानंतर, वेगवेगळ्या conditions नुसार वेगवेगळा code चालू शकतो**.

## सारांश

या धड्यात, आपण एक मूलभूत साइन-इन व्ह्यू पूर्ण केला, आणि विशेषतः “conditions च्या आधारे input content कसा judge करायचा” ही logic शिकलो.

या धड्याचा मुख्य मुद्दा असा आहे: string रिकामी आहे का ते ठरवण्यासाठी `isEmpty` वापरणे, आणि वेगवेगळ्या परिस्थिती हाताळण्यासाठी logical operators सोबत `if` statements वापरणे.

यात दोन अतिशय महत्त्वाचे logical operators आहेत:

- `&&`: अर्थ “आणि”, दोन्ही conditions पूर्ण झाल्या पाहिजेत
- `||`: अर्थ “किंवा”, एक condition पूर्ण झाली तरी पुरेसे आहे

जेव्हा या conditions शेवटी `true` किंवा `false` देतात, तेव्हा `if` statement परिणामानुसार वेगळा code चालवते.

या साइन-इन व्ह्यूद्वारे, आपण आधीच “इंटरफेस + डेटा + logical judgment” एकत्र करणाऱ्या development पद्धतीशी परिचित होऊ लागलो आहोत.

## पूर्ण कोड

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
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
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
