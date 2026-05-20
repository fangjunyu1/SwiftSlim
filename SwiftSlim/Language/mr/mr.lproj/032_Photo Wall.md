# फोटो गॅलरी

या धड्यात, आपण एक फोटो गॅलरी पेज तयार करू.

![view](../../../Resource/032_view13.png)

या उदाहरणात, आपण `extension`, `self` आणि instance यांचे ज्ञान पुन्हा पाहू, आणि SwiftUI मध्ये नेहमी वापरले जाणारे `Shape` ग्राफिक्स शिकू.

या ज्ञानाच्या मदतीने, आपण सामान्य चित्रांना वर्तुळ, गोल कोपऱ्याचा आयत, कॅप्सूल, लंबवर्तुळ अशा वेगवेगळ्या शैलींमध्ये crop करू शकतो, तसेच फोटोंना border प्रभाव देऊ शकतो.

या धड्यात काही नवीन ज्ञानबिंदू वापरले जातील: `Shape`, `clipShape`, `strokeBorder` आणि `overlay`.

यापैकी, `clipShape` view चा आकार crop करण्यासाठी वापरले जाते, `strokeBorder` shape चा border काढण्यासाठी वापरले जाते, आणि `overlay` सध्याच्या view च्या वर नवीन view ओव्हरले करण्यासाठी वापरले जाते.

## इमेज साहित्य

सुरू करण्यापूर्वी, आपल्याला काही चित्रे तयार करावी लागतील.

तुम्ही स्वतःचे फोटो वापरू शकता, किंवा या धड्यात दिलेली नमुना चित्रे वापरू शकता.

या धड्यातील फोटो नमुने [Pixabay](https://pixabay.com/) वेबसाइटवरून घेतले आहेत:

[लँडस्केप](https://cdn.pixabay.com/photo/2026/05/16/18/21/18-21-24-243_1280.jpg)、[कोल्हा](https://cdn.pixabay.com/photo/2026/05/11/10/40/10-40-15-288_1280.jpg)、[इमारत](https://cdn.pixabay.com/photo/2026/05/06/15/39/15-39-44-884_1280.jpg)、[फूल](https://cdn.pixabay.com/photo/2026/04/14/19/16/tomulus64-prunus-cerasifera-10226959_1280.jpg)、[हंस](https://cdn.pixabay.com/photo/2026/04/10/18/08/18-08-23-205_1280.jpg)

चित्रे डाउनलोड केल्यानंतर, ती `Assets` resource folder मध्ये जोडा, आणि क्रमाने `1`, `2`, `3`, `4`, `5` अशी नावे द्या.

![assets](../../../Resource/032_view17.png)

अशा प्रकारे, आपण SwiftUI मध्ये `Image("1")`, `Image("2")` अशा पद्धतीने चित्रे दाखवू शकतो.

## फोटो दाखवणे

सर्वप्रथम, आपण `ContentView` मध्ये 5 फोटो दाखवू:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)

                Image("5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

दिसणारा परिणाम:

![view](../../../Resource/032_view.png)

या कोडमध्ये, आपण `ScrollView` वापरून फोटो सूचीला scroll करता येईल अशी बनवतो, आणि `VStack` वापरून अनेक चित्रे वरून खाली मांडतो.

प्रत्येक चित्रात `.resizable()`, `.scaledToFit()` आणि `.frame(width: 300)` वापरून चित्राचा display effect सेट केला आहे, ज्यामुळे चित्र scale होऊ शकते, त्याचे प्रमाण पूर्ण ठेवून दिसते, आणि चित्राची रुंदी मर्यादित राहते.

`VStack` वरील `.padding(.vertical, 100)` वर-खाली spacing वाढवण्यासाठी वापरले आहे, त्यामुळे पहिला आणि शेवटचा फोटो स्क्रीनच्या कडेला खूप चिकटून दिसत नाही.

शेवटचे `.ignoresSafeArea()` म्हणजे scroll view safe area कडे दुर्लक्ष करते, त्यामुळे फोटो scroll होताना स्क्रीनच्या वरच्या आणि खालच्या भागापर्यंत विस्तारू शकतात, आणि page अधिक पूर्ण दिसते.

परंतु, सध्या 5 चित्रांमध्ये सर्वत्र तेच modifiers वापरले आहेत:

```swift
.resizable()
.scaledToFit()
.frame(width: 300)
```

जेव्हा आपल्याला repeated code दिसतो, तेव्हा तो व्यवस्थित करण्यासाठी `extension` वापरण्याचा विचार करू शकतो.

## extension वापरून इमेज शैली व्यवस्थित करणे

आपण `Image` साठी फोटो गॅलरीसाठी खास एक method विस्तारू शकतो:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

येथे, आपण `Image` type ला `photoGalleryStyle` method ने extend केले आहे.

या method मध्ये आधी वारंवार वापरलेले `.resizable()`, `.scaledToFit()` आणि `.frame(width: 300)` समाविष्ट आहेत. दुसऱ्या शब्दांत, हे image scaling, proportional display आणि width setting यांचा कोड एकत्र व्यवस्थित करते.

हे extension वापरल्यानंतर, मूळ image code:

```swift
Image("1")
    .resizable()
    .scaledToFit()
    .frame(width: 300)
```

असे सोपे करता येते:

```swift
Image("1")
    .photoGalleryStyle()
```

अशा प्रकारे, प्रत्येक चित्राला समान photo gallery style लागू करण्यासाठी फक्त `.photoGalleryStyle()` call करणे पुरेसे आहे. कोड अधिक स्वच्छ होतो, आणि नंतर एकसारखा बदल करणेही अधिक सोपे होते.

## self समजून घेणे

extension method मध्ये, आपण `self` लिहिले आहे:

```swift
extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}
```

येथे, `self` म्हणजे हा method call करणारा सध्याचा image instance.

उदाहरणार्थ:

```swift
Image("1")
    .photoGalleryStyle()
```

या कोडमध्ये, `photoGalleryStyle()` हा `Image("1")` ने call केला आहे, त्यामुळे method मधील `self` हीच `Image("1")` image दर्शवते.

हे साधेपणाने असे समजू शकता: जो हा method call करतो, `self` त्यालाच दर्शवते.

लक्षात ठेवण्याची गोष्ट म्हणजे SwiftUI चे modifiers सतत नवीन view result परत करतात. म्हणून, `photoGalleryStyle()` original `Image` स्वतः परत करत नाही, तर modified view परत करते.

## फोटोचे आकार

आता फोटो सामान्यपणे दिसू शकतात. परंतु, हे फोटो default स्वरूपात rectangle असतात, त्यामुळे ते थोडे सामान्य दिसतात.

जर फक्त फोटोंना गोल कोपरे द्यायचे असतील, तर आपण थेट `.cornerRadius()` वापरू शकतो:

```swift
Image("1")
    .photoGalleryStyle()
    .cornerRadius(20)
```

दिसणारा परिणाम:

![color](../../../Resource/032_view1.png)

`.cornerRadius(20)` म्हणजे image ला `20 pt` चा corner radius देणे. सामान्य rounded-corner image साठी ही syntax पुरेशी आहे.

परंतु, `.cornerRadius()` फक्त rounded-corner effect हाताळू शकते, आणि सामान्य गोल कोपऱ्याची image बनवण्यासाठी योग्य आहे. जर आपल्याला फोटो अधिक वेगवेगळ्या आकारांमध्ये बदलायचे असतील, तर हा modifier एकटा पुरेसा नाही.

या वेळी, आपल्याला SwiftUI मधील `Shape` वापरावे लागते. `Shape` वेगवेगळे graphics दर्शवू शकते, आणि `clipShape` सोबत वापरल्यास image ला संबंधित आकारात crop करता येते.

## Shape समजून घेणे

SwiftUI मध्ये, `Shape` म्हणजे graphic. `View` प्रमाणेच, ते SwiftUI मध्ये खूप सामान्यपणे वापरले जाणारे type आहे.

सामान्य `Shape` प्रकारांमध्ये circle, rectangle, rounded rectangle, capsule आणि ellipse यांचा समावेश होतो. वेगवेगळ्या graphics चे रूप अधिक स्पष्टपणे पाहण्यासाठी, खालील उदाहरणांमध्ये प्रत्येक graphic साठी वेगवेगळे रंग आणि आकार सेट केले आहेत.

या उदाहरणांमध्ये, `.fill()` graphic मध्ये रंग भरण्यासाठी वापरले जाते, आणि `.frame()` graphic चा display size सेट करण्यासाठी वापरले जाते. रंग फक्त वेगवेगळे graphics ओळखण्यासाठी आहेत, ते graphics चे स्वतःचे कायमचे रंग नाहीत.

### Circle वर्तुळ

`Circle` वर्तुळ दर्शवते. ते avatar, circular button, circular image आणि इतर interface effects साठी नेहमी वापरले जाते.

```swift
Circle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

![circle](../../../Resource/032_view3.png)

### Rectangle आयत

`Rectangle` आयत दर्शवते. ते सर्वात मूलभूत graphics पैकी एक आहे, आणि background, विभाजित क्षेत्र किंवा सामान्य border तयार करण्यासाठीही वापरता येते.

```swift
Rectangle()
    .fill(Color.green)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view4.png)

### RoundedRectangle गोल कोपऱ्याचा आयत

`RoundedRectangle` गोल कोपऱ्याचा आयत दर्शवते. `cornerRadius` कोपऱ्यांचा गोलपणा सेट करण्यासाठी वापरले जाते.

```swift
RoundedRectangle(cornerRadius: 20)
    .fill(Color.blue)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view5.png)

### Capsule कॅप्सूल आकार

`Capsule` कॅप्सूल आकार दर्शवते. त्याची दोन्ही टोके arc स्वरूपाची असतात, आणि ते capsule button, tag background आणि इतर interface effects साठी नेहमी वापरले जाते.

```swift
Capsule()
    .fill(Color.orange)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view6.png)

### Ellipse लंबवर्तुळ

`Ellipse` लंबवर्तुळ दर्शवते. ते `Circle` सारखेच आहे, पण width आणि height वेगवेगळे असतील तेव्हा ते ellipse म्हणून दिसते.

```swift
Ellipse()
    .fill(Color.purple)
    .frame(width: 150, height: 100)
```

![rectangle](../../../Resource/032_view7.png)

या उदाहरणांमधून आपण पाहू शकतो की `Shape` स्वतः थेट graphic म्हणून display होऊ शकते. पुढे, आपण हे `Shape` types `clipShape` सोबत वापरून फोटो crop करू, जेणेकरून ते वेगवेगळ्या आकारांत दिसतील.

## clipShape वापरून फोटो crop करणे

आता, आपण `clipShape` वापरून फोटो वेगवेगळ्या आकारांत crop करू शकतो.

उदाहरणार्थ, पहिला फोटो वर्तुळात crop करू:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

या कोडचा अर्थ असा: आधी एक image display करा, नंतर `Circle()` वापरून तिला वर्तुळात crop करा.

![view](../../../Resource/032_view2.png)

`clipShape` ची basic syntax अशी आहे:

```swift
.clipShape(shape)
```

view च्या मागे `.clipShape(...)` जोडा, आणि parentheses मध्ये तुम्हाला crop करायचा graphic भरा.

उदाहरणार्थ:

```swift
.clipShape(Circle())
.clipShape(Rectangle())
.clipShape(RoundedRectangle(cornerRadius: 20))
.clipShape(Capsule())
.clipShape(Ellipse())
```

आता, आपण 5 फोटो वेगवेगळ्या आकारांत crop करू:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

दिसणारा परिणाम:

![view](../../../Resource/032_view8.png)

यापैकी, `Rectangle()` ने crop केल्यानंतरचा परिणाम सामान्य rectangular photo सारखाच असतो, त्यामुळे visual change स्पष्ट दिसत नाही. तो मुख्यतः इतर shapes सोबत तुलना करण्यासाठी वापरला आहे.

आता, फोटो फक्त सामान्य rectangles राहिलेले नाहीत, तर त्यांना वेगवेगळे shapes मिळाले आहेत.

## फोटो border जोडणे

जर आपण circular photo ला border जोडू इच्छित असू, तर आपल्याला `border` वापरण्याचा विचार येऊ शकतो:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .border(Color.gray, width: 5)
```

परंतु, असे केल्यावर सहसा circular border मिळत नाही, तर rectangular border मिळतो.

![view](../../../Resource/032_view9.png)

याचे कारण असे की `border` view च्या rectangular area नुसार border जोडते, `clipShape` ने crop झालेल्या shape नुसार नाही.

म्हणून, जर आपल्याला circular border हवा असेल, तर `border` थेट वापरता येत नाही.

## strokeBorder वापरून shape border काढणे

SwiftUI मध्ये, `strokeBorder` या सामान्य `Shape` types साठी inner borders काढू शकते.

उदाहरणार्थ, circular border काढू:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
    .frame(width: 240, height: 240)
```

या कोडचा अर्थ असा: `Circle` साठी brown border काढा, आणि border width `10 pt` ठेवा.

![view](../../../Resource/032_view12.png)

येथे लक्षात ठेवण्याची गोष्ट म्हणजे `strokeBorder` थेट photo ला border जोडत नाही. ते `Circle()` या graphic साठी border काढते.

म्हणजेच, या कोडमधून फक्त एक स्वतंत्र circular border तयार होतो, आणि त्याचा photo शी अजून संबंध नसतो.

हा circular border photo च्या वर दिसावा असे असल्यास, border photo वर overlay करण्यासाठी आपल्याला पुढे `overlay` वापरावे लागेल.

## overlay वापरून border ओव्हरले करणे

`overlay` हा एक view modifier आहे, जो सध्याच्या view च्या वर नवीन view overlay करू शकतो.

त्याची basic structure अशी समजू शकते:

```swift
Current view
    .overlay {
        Overlay view
    }
```

या उदाहरणात, current view म्हणजे आधीच circle मध्ये crop केलेला photo:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
```

![view](../../../Resource/032_view2.png)

आपल्याला overlay करायचा नवीन view म्हणजे circular border:

```swift
Circle()
    .strokeBorder(Color.brown, lineWidth: 10)
```

![view](../../../Resource/032_view12.png)

म्हणून, आपण photo आणि border एकत्र करू शकतो:

```swift
Image("1")
    .photoGalleryStyle()
    .clipShape(Circle())
    .overlay {
        Circle()
            .strokeBorder(Color.brown, lineWidth: 10)
    }
```

येथे, `overlay` म्हणजे सध्याच्या view च्या वर नवीन view overlay करणे.

`overlay` मध्ये, border सध्याच्या photo च्या display range नुसार overlay होतो, त्यामुळे वेगळा `frame` सेट करण्याची गरज नाही. border shape आणि clipping shape एकसारखे असतील, तर border photo ला व्यवस्थित जुळतो.

![view](../../../Resource/032_view10.png)

अंतिम परिणाम असा आहे की circular photo वर circular border झाकला जातो.

`ZStack` च्या तुलनेत, `overlay` हा “सध्याच्या view ला decoration जोडणे” अशा scenario साठी अधिक योग्य आहे. photo हा मुख्य subject आहे, आणि border फक्त अतिरिक्त effect आहे, त्यामुळे `overlay` वापरणे अधिक स्पष्ट ठरते.

## फोटो गॅलरी पूर्ण करणे

आता, आपण प्रत्येक photo ला संबंधित shape आणि border जोडू:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}
```

दिसणारा परिणाम:

![view](../../../Resource/032_view13.png)

अशा प्रकारे, एक basic photo gallery page पूर्ण होते.

या page मध्ये, आपण scrollable display साठी `ScrollView` वापरले, photo दाखवण्यासाठी `Image` वापरले, photo shapes crop करण्यासाठी `clipShape` वापरले, आणि border जोडण्यासाठी `overlay` व `strokeBorder` वापरले.

## पूर्ण कोड

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Image("1")
                    .photoGalleryStyle()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .strokeBorder(Color.brown, lineWidth: 20)
                    }

                Image("2")
                    .photoGalleryStyle()
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle()
                            .strokeBorder(Color.green, lineWidth: 20)
                    }

                Image("3")
                    .photoGalleryStyle()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.blue, lineWidth: 20)
                    }

                Image("4")
                    .photoGalleryStyle()
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 20)
                    }

                Image("5")
                    .photoGalleryStyle()
                    .clipShape(Ellipse())
                    .overlay {
                        Ellipse()
                            .strokeBorder(Color.yellow, lineWidth: 20)
                    }
            }
            .padding(.vertical, 100)
        }
        .ignoresSafeArea()
    }
}

extension Image {
    func photoGalleryStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 300)
    }
}

#Preview {
    ContentView()
}
```

## सारांश

या धड्यात, आपण एक photo gallery page पूर्ण केले.

![view](../../../Resource/032_view13.png)

या उदाहरणात, आपण प्रथम `Image` वापरून photos दाखवले, आणि नंतर `extension` द्वारे `Image` साठी `photoGalleryStyle` method विस्तारली, ज्यामुळे repeated image style code व्यवस्थित झाला.

त्यानंतर, आपण SwiftUI मधील सामान्य `Shape` types शिकले, जसे `Circle`, `Rectangle`, `RoundedRectangle`, `Capsule` आणि `Ellipse`. हे graphics थेट display होऊ शकतात, तसेच `clipShape` सोबत view crop करण्यासाठीही वापरता येतात.

उदाहरणार्थ:

```swift
.clipShape(Circle())
```

याचा अर्थ view ला circle मध्ये crop करणे.

शेवटी, आपण photos ना संबंधित shape borders जोडण्यासाठी `overlay` आणि `strokeBorder` वापरले. लक्षात ठेवण्याची गोष्ट म्हणजे `border` सहसा view च्या rectangular area नुसार border काढते. जर border ने circle, capsule किंवा ellipse चा पाठपुरावा करावा असे वाटत असेल, तर समान `Shape` overlay करणे अधिक योग्य असते.

या धड्याद्वारे, आपण केवळ photo gallery effect पूर्ण केला नाही, तर interface मध्ये `Shape`, `clipShape`, `strokeBorder` आणि `overlay` यांचे सामान्य combination देखील समजून घेतले.

## धड्यानंतरचे सराव

### 1、फोटो गॅलरी background जोडा

photo gallery page ला full-screen background image जोडा.

अट: background image पूर्ण screen भरू शकेल आणि safe area कडे दुर्लक्ष करेल.

### 2、Gradient border

सध्याचे single-color borders linear gradient borders मध्ये बदला.

अधिक समृद्ध border effects तयार करण्यासाठी `LinearGradient` वापरून पाहू शकता.

### 3、नक्कल केलेली photo frame

Internet वर काही वास्तविक photo frame styles शोधा, आणि `overlay` वापरून image frames overlay करण्याचा प्रयत्न करा, जेणेकरून photos वास्तविक picture frames सारखे अधिक दिसतील.

सरावाचा display result:

![button](../../../Resource/032_view15.jpeg)

### 4、rounded button border तयार करा

प्रत्यक्ष development मध्ये, buttons नेहमी rounded rectangle borders वापरतात.

एक rounded button तयार करून पाहा, आणि `RoundedRectangle` व `strokeBorder` वापरून button ला rounded border जोडा.

सरावाचा display result:

![button](../../../Resource/032_view14.png)

### विचार प्रश्न

जर तुम्हाला single-color border किंवा gradient border वापरायचा नसेल, पण border मध्ये एखादा pattern effect दाखवायचा असेल, तर ते कसे implement कराल?

तुम्ही `overlay`, `mask` किंवा `ImagePaint` यांसारख्या संबंधित usages बद्दल माहिती शोधून पाहू शकता.

सरावाचा display result:

![button](../../../Resource/032_view16.png)
