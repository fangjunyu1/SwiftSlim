# Xcode फायली व्यवस्थापित करणे

या धड्यात, आपण Xcode मधील सामान्य फाइल ऑपरेशन्स शिकणार आहोत.

मागील धड्यांमध्ये, आपण बहुतेक कोड `ContentView` मध्ये लिहिला. त्यामुळे कोड आणि दाखवला जाणारा परिणाम पाहणे सोपे होते.

उदाहरणार्थ:

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

पण खऱ्या App मध्ये, सहसा सर्व कोड एका फाइलमध्ये लिहिला जात नाही.

पेज, कॉम्पोनंट आणि फंक्शन्स वाढत गेल्यावर, आपल्याला वेगवेगळे views वेगवेगळ्या SwiftUI फायलींमध्ये विभागावे लागतात.

उदाहरणार्थ:

```swift
ContentView.swift
CardView.swift
AuthorView.swift
```

यामुळे कोडची रचना अधिक स्पष्ट होते, तसेच नंतर देखभाल आणि बदल करणे सोपे होते.

## फायली व्यवस्थापित करण्याची गरज का आहे

SwiftUI मध्ये, एखादे पेज किंवा कॉम्पोनंट सहसा स्वतंत्र view file म्हणून लिहिता येते.

उदाहरणार्थ:

```swift
struct CardView: View {
    var body: some View {
        Text("Card")
    }
}
```

येथील `CardView` हा एक SwiftUI view आहे.

जर सर्व views `ContentView` मध्येच लिहिले, तर कोड अधिकाधिक लांब होईल आणि वाचायलाही कठीण होईल.

म्हणून, आपल्याला फायली तयार करणे, नाव बदलणे, हटवणे, तसेच वेगवेगळ्या कोड फायली व्यवस्थापित करण्यासाठी फोल्डर वापरणे शिकावे लागते.

## SwiftUI फाइल तयार करणे

Xcode मध्ये SwiftUI फाइल तयार करण्याचे साधारणपणे दोन सामान्य मार्ग आहेत:

एक म्हणजे रिकामी फाइल तयार करणे आणि मग स्वतः कोड लिहिणे.

दुसरा म्हणजे SwiftUI template file तयार करणे, ज्यात Xcode मूलभूत कोड आपोआप तयार करतो.

नवशिक्यांसाठी SwiftUI template file वापरण्याची अधिक शिफारस केली जाते, कारण ती मूलभूत रचना आपोआप तयार करते.

### रिकामी फाइल तयार करणे

Xcode च्या डाव्या बाजूच्या Navigator भागात, रिकाम्या जागेवर किंवा फोल्डरवर right-click करून `New Empty File` निवडा.

ऑपरेशनचे स्थान खालीलप्रमाणे आहे:

![xcode](../../../Resource/027_view1.png)

रिकामी फाइल तयार केल्यानंतर, Xcode सहसा नाव नसलेली Swift फाइल तयार करतो, उदाहरणार्थ `Untitled.swift`.

आपण तिचे नाव `TestView.swift` असे बदलू शकतो.

SwiftUI प्रोजेक्टमध्ये, जर ही फाइल view दाखवण्यासाठी वापरली जात असेल, तर नावाच्या शेवटी सहसा `View` जोडण्याची शिफारस केली जाते.

उदाहरणार्थ:

```swift
HomeView.swift
CardView.swift
ProfileView.swift
```

हा सक्तीचा नियम नाही, पण यामुळे ही view file आहे हे एका नजरेत कळते.

रिकामी फाइल तयार केल्यानंतर, फाइलमध्ये फक्त default comments असू शकतात किंवा ती पूर्णपणे रिकामीही असू शकते. हे Xcode version आणि तयार करण्याच्या पद्धतीवर अवलंबून असते.

```swift
//
//  TestView.swift
//  SwiftSlimTest
//
//  Created by Fang Junyu on 2026/5/12.
//
```

या वेळी, आपल्याला SwiftUI कोड हाताने लिहावा लागतो:

```swift
import SwiftUI

struct TestView: View {
    var body: some View {
        Text("This is Test")
    }
}

#Preview {
    TestView()
}
```

अशाप्रकारे, एक साधी SwiftUI view file तयार होते.

### फाइलचे नाव बदलणे

फाइल तयार केल्यानंतर तिचे नाव बदलायचे असल्यास, Xcode च्या डाव्या बाजूच्या Navigator भागात ती फाइल निवडा आणि मग enter key `⏎` दाबा.

![xcode](../../../Resource/027_view2.png)

यानंतर फाइलचे नाव बदलता येते.

लक्षात ठेवण्यासारखी गोष्ट म्हणजे, फाइलचे नाव बदलल्याने कोडमधील view name आपोआप बदलत नाही.

उदाहरणार्थ, फाइलचे नाव `ProfileView.swift` केले तरी कोडमध्ये अजूनही `struct TestView: View` असू शकते.

असे असणे अनिवार्यपणे error निर्माण करत नाही, पण ते गोंधळ निर्माण करू शकते.

म्हणून, फाइलचे नाव आणि view name एकसारखे ठेवण्याची शिफारस केली जाते. उदाहरणार्थ, फाइलचे नाव `ProfileView.swift` असल्यास, view name सुद्धा `ProfileView` वापरा.

## SwiftUI template file तयार करणे

रिकामी फाइल तयार करण्याव्यतिरिक्त, आपण थेट SwiftUI template file देखील तयार करू शकतो.

Xcode च्या डाव्या बाजूच्या Navigator भागात, रिकाम्या जागेवर किंवा फोल्डरवर right-click करून `New File from Template...` निवडा.

ऑपरेशनचे स्थान खालीलप्रमाणे आहे:

![xcode](../../../Resource/027_view3.png)

उघडलेल्या विंडोमध्ये, वरच्या भागात वेगवेगळे platforms निवडता येतात, उदाहरणार्थ `iOS`, `macOS` इत्यादी.

येथे सध्याच्या प्रोजेक्टला अनुरूप असलेला platform निवडलेला ठेवला तरी चालते. उदाहरणार्थ, आपण iOS App तयार करत असू, तर `iOS` निवडा.

![xcode](../../../Resource/027_view4.png)

मग खाली `SwiftUI View` निवडा.

![xcode](../../../Resource/027_view12.png)

मग `Next` क्लिक करून फाइलचे नाव टाका आणि save करा.

उदाहरणार्थ, आपण `Test2View.swift` तयार करतो.

Xcode खालीलप्रमाणे कोड आपोआप तयार करेल:

```swift
import SwiftUI

struct Test2View: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    Test2View()
}
```

रिकाम्या फाइलशी तुलना केली तर, template file मध्ये `import SwiftUI`, `struct`, `body` आणि `#Preview` आपोआप समाविष्ट असतात.

म्हणून नवशिक्यांसाठी SwiftUI template file वापरणे अधिक सोपे असते आणि कोड लिहायचा राहून जाण्याची शक्यता कमी होते.

**सूचना**: right-click करून फाइल तयार करण्याव्यतिरिक्त, Xcode च्या डाव्या बाजूच्या Navigator च्या तळाशी असलेल्या plus button वर क्लिक करूनही फाइल किंवा फोल्डर तयार करता येते.

![xcode](../../../Resource/027_view5.png)

## फोल्डर तयार करणे

फायली वाढत गेल्यावर, आपण त्यांचे व्यवस्थापन करण्यासाठी फोल्डर वापरू शकतो.

Xcode च्या डाव्या बाजूच्या Navigator भागात, रिकाम्या जागेवर किंवा फोल्डरवर right-click करून `New Folder` निवडा.

फोल्डर तयार केल्यानंतर, संबंधित फायली त्या फोल्डरमध्ये drag करू शकतो.

![xcode](../../../Resource/027_view7.png)

फोल्डर मुख्यतः प्रोजेक्टची रचना व्यवस्थित ठेवण्यासाठी वापरले जातात. ते view स्वतः कसा वापरला जातो हे बदलत नाहीत.

जोपर्यंत view name बरोबर आहे, तोपर्यंत इतर फायलींमध्ये तो अजूनही `TestView()` आणि `Test2View()` अशा प्रकारे वापरता येतो.

## फाइल किंवा फोल्डर हटवणे

फाइल किंवा फोल्डर हटवायचा असल्यास, Xcode च्या डाव्या बाजूच्या Navigator भागात संबंधित फाइल निवडा, मग right-click करून `Delete` निवडा.

फाइल निवडल्यानंतर delete key `⌫` दाबूनही हे करता येते.

Xcode deletion confirmation window दाखवेल.

![xcode](../../../Resource/027_view10.png)

`Move to Trash` निवडल्यास, फाइल Trash मध्ये हलवली जाते.

जर `Remove Reference` दिसले, तर त्याचा अर्थ फक्त Xcode project मधून reference काढला जातो, पण disk वरील मूळ फाइल हटवली जात नाही.

नवशिक्यांसाठी, जर स्वतः नुकतीच तयार केलेली साधी फाइल हटवायची असेल, तर सहसा `Move to Trash` निवडणे पुरेसे असते.

## अनेक SwiftUI views दाखवणे

फाइल तयार करणे शिकल्यानंतर, आपण वेगवेगळे views वेगवेगळ्या फायलींमध्ये विभागू शकतो.

उदाहरणार्थ, आपण दोन SwiftUI फायली तयार करतो:

```swift
AuthorView.swift
CardView.swift
```

`AuthorView` लेखकाचे नाव दाखवण्यासाठी वापरला जातो:

```swift
import SwiftUI

struct AuthorView: View {
    var body: some View {
        Text("Fang Junyu")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }
}
```

`CardView` card background दाखवण्यासाठी वापरला जातो:

```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.indigo.opacity(0.8))
            .frame(width: 200, height: 50)
    }
}
```

मग, आपण `ContentView` मध्ये हे दोन views वापरू शकतो:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CardView()
            AuthorView()
        }
    }
}

#Preview {
    ContentView()
}
```

Run केल्यानंतर, `CardView` आणि `AuthorView` एकत्रितपणे दाखवलेले दिसतील:

![xcode](../../../Resource/027_view11.png)

या परिणामात, `CardView` background म्हणून काम करतो आणि `AuthorView` वर दाखवला जातो. कारण ते `ZStack` मध्ये ठेवलेले आहेत.

`ContentView` मध्ये, आपण `CardView()` आणि `AuthorView()` द्वारे हे दोन views वापरतो. नावानंतरचे `()` हे हा view तयार करून वापरणे दर्शवते.

हे SwiftUI मधील सामान्य view nesting आहे: एका view मध्ये इतर views पुढे वापरता येतात.

## entry file

शेवटी, App interface कुठून दाखवायला सुरुवात होते हे पुन्हा पाहू.

SwiftUI प्रोजेक्टमध्ये, सहसा एक entry file असते:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

येथील `@main` दर्शवते की हे App चे entry point आहे.

`WindowGroup` मध्ये आपण पाहतो:

```swift
ContentView()
```

याचा अर्थ App सुरू झाल्यानंतर सर्वप्रथम `ContentView` दाखवला जातो.

मग `ContentView` मध्ये पुन्हा हे दाखवले जाते:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

म्हणून view hierarchy खालीलप्रमाणे समजू शकतो:

```swift
SwiftSlimTestApp
    - ContentView
        - CardView
        - AuthorView
```

जर आपण entry file मध्ये दाखवला जाणारा view `CardView` असा बदलला:

```swift
import SwiftUI

@main
struct SwiftSlimTestApp: App {
    var body: some Scene {
        WindowGroup {
            CardView()
        }
    }
}
```

तर App सुरू झाल्यानंतर फक्त `CardView` दाखवला जाईल.

म्हणजेच, entry code मधील `WindowGroup` ठरवतो की App सुरू झाल्यानंतर सर्वप्रथम कोणता view दाखवला जाईल.

आणि त्या view च्या आत, इतर views पुढे दाखवता येतात.

## सारांश

या धड्यात, आपण Xcode मधील सामान्य file management operations शिकलो.

आपण SwiftUI फायली कशा तयार करायच्या, फायलींचे नाव कसे बदलायचे, फोल्डर कसे तयार करायचे, तसेच फाइल कशी हटवायची हे जाणून घेतले.

त्याचबरोबर, आपण एक महत्त्वाची संकल्पना देखील शिकलो: SwiftUI views वेगवेगळ्या फायलींमध्ये विभागता येतात आणि नंतर इतर views मध्ये वापरता येतात.

उदाहरणार्थ:

```swift
ZStack {
    CardView()
    AuthorView()
}
```

येथील `CardView()` आणि `AuthorView()` म्हणजे `ContentView` मध्ये इतर views वापरणे.

शेवटी, आपण entry file चा display logic देखील पुन्हा पाहिला.

App सुरू होताना, तो आधी `@main` mark असलेल्या entry code मध्ये प्रवेश करतो, आणि मग `WindowGroup` मधील view दाखवतो.

यामुळे आपल्याला हे समजण्यास मदत होते: वेगवेगळ्या SwiftUI फायली स्वतंत्र आणि एकमेकांपासून तुटलेल्या नसतात. त्या एकमेकांशी जोडल्या जाऊन अखेरीस पूर्ण App interface तयार करतात.
