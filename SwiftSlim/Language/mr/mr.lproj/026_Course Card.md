# कोर्स कार्ड

ही शिकवण एक टप्पा-पुनरावलोकन धडा आहे. आपण एक “कोर्स कार्ड” पूर्ण करणार आहोत.

या सरावाद्वारे, आपण आधी शिकलेले `Text`, `Image`, `VStack`, `HStack`, `Spacer()`, `.padding()`, `.background()`, `.cornerRadius()` इत्यादी पुन्हा पाहू शकतो, आणि अनेक लहान views एकत्र करून पूर्ण view module कसा तयार करायचा ते शिकू शकतो.

कोर्स कार्डचा परिणाम:

![view](../../../Resource/026_view.png)

हे कोर्स कार्ड मुख्यतः काही भागांनी बनलेले आहे:

- कोर्स पातळी: `नवशिक्या`
- कोर्स सामग्री: `20+ धडे`
- कोर्स शीर्षक: `SwiftUI नवशिक्यांसाठी ट्यूटोरियल`
- कोर्स वर्णन
- बटण: `शिकणे सुरू करा`
- कोर्स पार्श्वभूमी: Swift चिन्ह आणि इंडिगो रंगाची पार्श्वभूमी

आपण हा view `ContentView` मध्ये पूर्ण करू शकतो.

## शीर्ष क्षेत्र

सर्वप्रथम, कोर्स कार्डचे शीर्ष क्षेत्र तयार करू.

![view](../../../Resource/026_view1.png)

शीर्ष क्षेत्राच्या डाव्या बाजूला कोर्स पातळी दिसते, आणि उजव्या बाजूला कोर्स सामग्री दिसते.

कारण हे दोन घटक आडवे मांडलेले आहेत, म्हणून `HStack` वापरता येतो.

```swift
var topView: some View {
    HStack {
        Text("नवशिक्या")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white.opacity(0.15))
            .cornerRadius(20)

        Spacer()

        Text("20+ धडे")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

येथे आपण शीर्ष क्षेत्राला एका computed property मध्ये वेगळे केले आहे:

```swift
var topView: some View
```

असे केल्याचा फायदा म्हणजे `body` अधिक स्पष्ट राहतो.

शीर्ष क्षेत्रात मुख्यतः हे घटक वापरले आहेत:

- `HStack`: दोन texts आडवे मांडतो.
- `Text`: मजकूर सामग्री दाखवतो.
- `Spacer()`: डावीकडील text डावीकडे आणि उजवीकडील text उजवीकडे ढकलतो.
- `.font(.footnote)`: लहान मजकूर style सेट करतो.
- `.fontWeight(.bold)`: मजकूर bold करतो.
- `.foregroundStyle(Color.white)`: foreground color पांढरा सेट करतो.
- `.padding(.vertical, 10)`: वर-खाली padding सेट करतो.
- `.padding(.horizontal, 16)`: डावे-उजवे padding सेट करतो.
- `.background(Color.white.opacity(0.15))`: अर्धपारदर्शक पांढरी background सेट करतो.
- `.cornerRadius(20)`: corner radius सेट करतो.

येथे `नवशिक्या` साठी दोन दिशांमधील `.padding()` वापरले आहे:

```swift
.padding(.vertical, 10)
.padding(.horizontal, 16)
```

यामुळे मजकुराच्या वर-खाली आणि डावे-उजवे दोन्हीकडे जागा मिळते, आणि ते अधिक label सारखे दिसते.

`Color.white.opacity(0.15)` म्हणजे `15%` opacity असलेला पांढरा रंग, म्हणजे अतिशय हलका पांढरा.

### कार्ड background जोडणे

आधी आपण `topView` तयार केला, पण फक्त view तयार केल्याने तो आपोआप दिसत नाही.

SwiftUI मध्ये, interface वर खरोखर दिसणारी सामग्री `body` मध्ये लिहावी लागते.

म्हणून, आधी `topView` ला `body` मध्ये ठेवून दाखवू शकतो:

```swift
struct ContentView: View {
    var body: some View {
        topView
    }
}
```

आता शीर्ष क्षेत्र दिसू लागलेले पाहता येईल:

![view](../../../Resource/026_view2.png)

परंतु, कारण `topView` मधील मजकूर पांढरा आहे आणि default background देखील फिकट आहे, त्यामुळे light mode मध्ये तो स्पष्ट दिसणार नाही.

म्हणून आपण बाहेरील स्तरावर एक `VStack` जोडू शकतो, आणि मग संपूर्ण क्षेत्रासाठी padding, background color आणि corner radius सेट करू शकतो:

```swift
var body: some View {
	VStack {
	    topView
	}
	.padding(20)
	.background(Color.indigo)
	.cornerRadius(20)
	.padding(30)
}
```

दिसणारा परिणाम:

![view](../../../Resource/026_view3.png)

येथे `VStack` मध्ये सध्या फक्त एक `topView` ठेवलेला आहे, त्यामुळे ते आवश्यक नसल्यासारखे वाटू शकते.

पण नंतर आपण कोर्स शीर्षक, कोर्स वर्णन आणि बटण क्षेत्र जोडणार आहोत. ते सर्व वर-खाली मांडलेले घटक आहेत, म्हणून येथे आधीच `VStack` वापरल्यास नंतर views एकत्र करणे सोपे होते.

येथे दोन `.padding()` आहेत, आणि त्यांची कामे वेगवेगळी आहेत.

पहिला `.padding(20)` `.background()` च्या आधी लिहिला आहे:

```swift
.padding(20)
.background(Color.indigo)
```

तो कार्डच्या आतील अंतरावर नियंत्रण ठेवतो, म्हणजे content आणि background च्या कडेच्या मधील अंतर.

दुसरा `.padding(30)` `.background()` नंतर लिहिला आहे:

```swift
.background(Color.indigo)
.cornerRadius(20)
.padding(30)
```

तो कार्डच्या बाहेरील अंतरावर नियंत्रण ठेवतो, म्हणजे संपूर्ण कार्ड आणि screen च्या कडेमधील अंतर.

![view](../../../Resource/026_view4.png)

म्हणून, तेच `.padding()` वेगवेगळ्या ठिकाणी लिहिल्यास परिणामही वेगळा होतो.

## सामग्री क्षेत्र

यानंतर कोर्स कार्डचे सामग्री क्षेत्र तयार करू.

दिसणारा परिणाम:

![view](../../../Resource/026_view5.png)

सामग्री क्षेत्रात कोर्स शीर्षक आणि कोर्स वर्णन असते. ते वर-खाली मांडलेले आहेत, म्हणून `VStack` वापरतो.

```swift
var contentView: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("SwiftUI नवशिक्यांसाठी ट्यूटोरियल")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)

        Text("SwiftUI सह शून्यापासून सुरुवात करा आणि Apple च्या declarative UI development चे पद्धतशीर शिक्षण घ्या. स्पष्ट स्पष्टीकरणे आणि व्यावहारिक उदाहरणांद्वारे, तुम्ही हळूहळू layout, interaction आणि state management आत्मसात कराल, आणि सुंदर व उपयुक्त app interfaces तयार करू शकाल.")
            .font(.footnote)
            .fontWeight(.medium)
            .foregroundStyle(Color.white)
            .lineLimit(3)
    }
}
```

दिसणारा परिणाम:

![view](../../../Resource/026_view6.png)

येथील `VStack` मध्ये दोन parameters वापरले आहेत:

```swift
VStack(alignment: .leading, spacing: 10)
```

`alignment: .leading` म्हणजे `VStack` च्या आतल्या views ला डावीकडे align करणे.

`spacing: 10` म्हणजे `VStack` च्या आतल्या views मध्ये `10 pt` अंतर ठेवणे.

म्हणून, कोर्स शीर्षक आणि कोर्स वर्णन डाव्या बाजूपासून मांडले जातील, आणि त्यांच्यामध्ये काही अंतर राहील.

कोर्स वर्णन तुलनेने लांब आहे. जर ते पूर्णपणे दाखवले, तर कार्ड फार उंच होईल. म्हणून येथे `.lineLimit()` वापरून दाखवायच्या ओळींची संख्या मर्यादित केली आहे:

```swift
.lineLimit(3)
```

याचा अर्थ जास्तीत जास्त `3` ओळी दाखवणे. सामग्री मर्यादेपेक्षा जास्त असल्यास, उरलेला भाग वगळला जातो.

### View डावीकडे align करणे

येथे अजून एक गोष्ट लक्षात ठेवावी लागेल.

`VStack(alignment: .leading)` फक्त `VStack` च्या आतल्या views ची alignment नियंत्रित करते. ते `VStack` स्वतः बाहेरील container मध्ये कुठे आहे हे थेट नियंत्रित करत नाही.

उदाहरणार्थ, जर कोर्स वर्णन तुलनेने लहान असेल:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("SwiftUI नवशिक्यांसाठी ट्यूटोरियल")
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)

    Text("फक्त थोडी सामग्री.")
        .font(.footnote)
        .fontWeight(.medium)
        .foregroundStyle(Color.white)
        .lineLimit(3)
}
```

दिसणारा परिणाम:

![view](../../../Resource/026_view7.png)

आपण पाहू शकतो की, कोर्स शीर्षक आणि कोर्स वर्णन `VStack` च्या आत डावीकडे align आहेत, पण संपूर्ण `VStack` कार्डच्या अगदी डाव्या बाजूला गेलेला नाही.

कारण content लहान असताना, `VStack` ची width देखील कमी असते. बाहेरील container layout करताना हा अरुंद `VStack` मधोमध ठेवू शकतो.

याचा अर्थ असा समजू शकतो: `VStack(alignment: .leading)` आतल्या left alignment ची जबाबदारी घेतो.
पण तो संपूर्ण सामग्री क्षेत्राला अगदी डावीकडे ढकलण्याची जबाबदारी घेत नाही.

जर संपूर्ण सामग्री क्षेत्र खरोखर डावीकडे हवे असेल, तर बाहेर अजून एक `HStack` गुंडाळून `Spacer()` जोडता येतो:

```swift
var contentView: some View {
    HStack {
        VStack(alignment: .leading, spacing: 10) {
            Text("SwiftUI नवशिक्यांसाठी ट्यूटोरियल")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Text("फक्त थोडी सामग्री.")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
                .lineLimit(3)
        }

        Spacer()
    }
}
```

दिसणारा परिणाम:

![view](../../../Resource/026_view8.png)

येथील `HStack` horizontal layout आहे.

`Spacer()` उजव्या बाजूची उरलेली जागा व्यापतो, त्यामुळे डावीकडील `VStack` सर्वात डावीकडे ढकलला जातो.

म्हणून, `HStack + Spacer()` संपूर्ण सामग्री क्षेत्राची स्थिती नियंत्रित करण्यासाठी वापरता येते.

प्रत्यक्ष कोर्स कार्डमध्ये, कोर्स वर्णन तुलनेने लांब असते आणि सामान्यतः अधिक width व्यापते, म्हणून ही समस्या नेहमी स्पष्ट दिसेलच असे नाही. पण हा फरक समजून घेणे महत्त्वाचे आहे, कारण पुढे short text layout तयार करताना अशा परिस्थिती अनेकदा येतात.

### आतील views मधील अंतर नियंत्रित करणे

आधी आपण `VStack` मध्ये `spacing: 10` लिहिले होते:

```swift
VStack(alignment: .leading, spacing: 10) {
    ...
}
```

`spacing` आतील views मधील अंतर नियंत्रित करण्यासाठी वापरले जाते.

जर `spacing` सेट केले नाही, तरीही `VStack` कडे default अंतर असते, पण ते default अंतर आपल्याला अपेक्षित परिणामाशी नेहमी जुळेलच असे नाही.

येथे, कोर्स शीर्षक आणि कोर्स वर्णन खूप जवळ असतील तर ते गच्च वाटेल, म्हणून वापरतो:

```swift
spacing: 10
```

यामुळे त्यांच्यामध्ये थोडी जागा राहते.

दिसणारा परिणाम:

![view](../../../Resource/026_view9.png)

त्याचप्रमाणे, शीर्ष क्षेत्र आणि सामग्री क्षेत्र देखील वर-खाली मांडलेले आहेत, म्हणून त्यांच्यातील अंतर नियंत्रित करण्यासाठी `spacing` वापरता येते.

आता `topView` आणि `contentView` ला `body` मध्ये ठेवू:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

दिसणारा परिणाम:

![view](../../../Resource/026_view10.png)

येथील `VStack(spacing: 20)` `topView` आणि `contentView` मधील अंतर नियंत्रित करतो.

म्हणजेच:

```swift
VStack(alignment: .leading, spacing: 10)
```

हे कोर्स शीर्षक आणि कोर्स वर्णन मधील अंतर नियंत्रित करते.

```swift
VStack(spacing: 20)
```

हे शीर्ष क्षेत्र आणि सामग्री क्षेत्र मधील अंतर नियंत्रित करते.

दोन्ही `spacing` आहेत, पण ते वेगवेगळ्या `VStack` वर लागू होतात, त्यामुळे त्यांचा प्रभाव पडणारा परिसरही वेगळा असतो.

अशा प्रकारे, सामग्री क्षेत्राचा view पूर्ण झाला.

## बटण क्षेत्र

यानंतर तळाशी असलेले बटण क्षेत्र तयार करू.

दिसणारा परिणाम:

![view](../../../Resource/026_view11.png)

बटण क्षेत्र मुख्यतः एक play चिन्ह आणि एक मजकूर यांपासून बनलेले आहे.

आपण `Image` वापरून play चिन्ह दाखवू शकतो, आणि `Text` वापरून बटणाचा मजकूर दाखवू शकतो.

येथे आधी बटणाचा appearance तयार करतो:

```swift
var buttonView: some View {
    HStack {
        Button {
            print("बटण क्लिक झाले")
        } label: {
            HStack {
                Image(systemName: "play.fill")

                Text("शिकणे सुरू करा")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.indigo)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)

        Spacer()
    }
}
```

दिसणारा परिणाम:

![view](../../../Resource/026_view12.png)

येथे दोन `HStack` वापरले आहेत:

आतला `HStack` चिन्ह आणि मजकूर आडवे मांडण्यासाठी वापरला आहे:

```swift
HStack {
    Image(systemName: "play.fill")
    Text("शिकणे सुरू करा")
}
```

बाहेरचा `HStack` `Spacer()` सोबत वापरला आहे, ज्यामुळे हा बटणाचा appearance डावीकडे दिसतो:

```swift
HStack {
    ...
    Spacer()
}
```

बटण क्लिक केल्यावर, console मध्ये `बटण क्लिक झाले` output होईल.

## मूलभूत कार्ड पूर्ण

आता शीर्ष क्षेत्र, सामग्री क्षेत्र आणि बटण क्षेत्र एकत्र करू:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

दिसणारा परिणाम:

![view](../../../Resource/026_view13.png)

येथपर्यंत, एक मूलभूत कोर्स कार्ड तयार झाले आहे.

## Swift चिन्ह background

शेवटी, आपण कार्डमध्ये अर्धपारदर्शक Swift चिन्ह background म्हणून जोडू.

![view](../../../Resource/026_view.png)

आधी आपण `Color.indigo` background color म्हणून वापरला होता. प्रत्यक्षात, `.background()` रंग जोडण्याबरोबरच पूर्ण view देखील जोडू शकतो.

म्हणून, आधी आपण एक स्वतंत्र background view तयार करू शकतो:

```swift
var backgroundView: some View {
    VStack {
        Spacer()

        HStack {
            Spacer()

            Image(systemName: "swift")
                .font(.system(size: 100))
                .foregroundStyle(Color.white.opacity(0.15))
        }
    }
    .padding(30)
}
```

या background view मध्ये, आपण `VStack`, `HStack` आणि `Spacer()` वापरून Swift चिन्ह उजव्या-खालच्या कोपऱ्यात ढकलतो.

कारण Swift चिन्ह फक्त decorative background म्हणून वापरले आहे, म्हणून येथे अर्धपारदर्शक पांढरा रंग वापरला आहे:

```swift
Color.white.opacity(0.15)
```

यामुळे चिन्ह खूप उठून दिसत नाही, आणि पुढील मजकुरावर परिणाम करत नाही.

यानंतर, `backgroundView` कार्डमध्ये जोडू:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }
}
```

अमलात आल्यानंतरचा परिणाम:

![view](../../../Resource/026_view14.png)

येथे सलग दोन `.background()` वापरले आहेत:

```swift
.background(backgroundView)
.background(Color.indigo)
```

पहिला `.background()` Swift चिन्ह background जोडण्यासाठी वापरला आहे.
दुसरा `.background()` इंडिगो रंगाची background जोडण्यासाठी वापरला आहे.

अशा प्रकारे, Swift चिन्ह इंडिगो background वर दिसेल, आणि कार्डच्या background च्या एका भागाप्रमाणे प्रदर्शित होईल.

यावरून दिसते की, `.background()` रंग जोडण्याबरोबरच custom view देखील जोडू शकतो. अनेक `.background()` एकत्र वापरून अधिक समृद्ध background effects तयार करता येतात.

येथपर्यंत, एक पूर्ण कोर्स कार्ड तयार झाले आहे.

## सारांश

या धड्यात, आपण एका कोर्स कार्डद्वारे SwiftUI मधील सामान्य मूलभूत layout पद्धती पुन्हा पाहिल्या.

आपण `Text` वापरून मजकूर दाखवला, `Image` वापरून system icon दाखवला, आणि `VStack`, `HStack` व `Spacer()` वापरून views ची मांडणी नियंत्रित केली.

आपण `.lineLimit()` शिकलो. ते मजकूर जास्तीत जास्त किती ओळी दाखवेल हे मर्यादित करू शकते. content मर्यादेपेक्षा जास्त असल्यास, उरलेला भाग वगळला जातो.

त्याच वेळी, आपण `.padding()`, `.background()`, `.cornerRadius()`, `.foregroundStyle()` यांसारखे सामान्य modifiers देखील पुन्हा पाहिले.

हा धडा पूर्ण केल्यानंतर, आपण अनेक लहान views एकत्र करून एक पूर्ण card module तयार करू शकतो.

SwiftUI development मध्ये ही अतिशय सामान्य विचारपद्धती आहे: आधी लहान views मध्ये विभागणे, आणि मग त्यांना एकत्र करून पूर्ण interface तयार करणे.

## पूर्ण कोड

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            topView
            contentView
            buttonView
        }
        .padding(20)
        .background(backgroundView)
        .background(Color.indigo)
        .cornerRadius(20)
        .padding(30)
    }

    var topView: some View {
        HStack {
            Text("नवशिक्या")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)

            Spacer()

            Text("20+ धडे")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }

    var contentView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("SwiftUI नवशिक्यांसाठी ट्यूटोरियल")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)

                Text("SwiftUI सह शून्यापासून सुरुवात करा आणि Apple च्या declarative UI development चे पद्धतशीर शिक्षण घ्या. स्पष्ट स्पष्टीकरणे आणि व्यावहारिक उदाहरणांद्वारे, तुम्ही हळूहळू layout, interaction आणि state management आत्मसात कराल, आणि सुंदर व उपयुक्त app interfaces तयार करू शकाल.")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .lineLimit(3)
            }

            Spacer()
        }
    }

    var buttonView: some View {
    	HStack {
    	    Button {
    	        print("बटण क्लिक झाले")
    	    } label: {
    	        HStack {
    	            Image(systemName: "play.fill")

    	            Text("शिकणे सुरू करा")
    	                .font(.subheadline)
    	                .fontWeight(.bold)
    	        }
    	        .foregroundStyle(Color.indigo)
    	        .padding(.vertical, 10)
    	        .padding(.horizontal, 16)
    	        .background(Color.white)
    	        .cornerRadius(16)
    	    }
    	    .buttonStyle(.plain)

    	    Spacer()
    	}
	}
    
    var backgroundView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                Image(systemName: "swift")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.white.opacity(0.15))
            }
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}
```
