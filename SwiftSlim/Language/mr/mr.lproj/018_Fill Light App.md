# फिल लाइट अॅप

या धड्यात, आपण एक खूपच मनोरंजक फिल लाइट अॅप तयार करू. रात्रीच्या वेळी, आपण फोनच्या स्क्रीनवर वेगवेगळे रंग दाखवू शकतो आणि त्याचा एक साधा फिल लाइट म्हणून वापर करू शकतो.

हे फिल लाइट अॅप स्क्रीनवर टॅप करून रंग बदलू शकते, तसेच स्लायडर वापरून ब्राइटनेसही समायोजित करू शकते.

या उदाहरणात, `brightness` वापरून व्ह्यूची ब्राइटनेस कशी बदलायची, `onTapGesture` वापरून व्ह्यूमध्ये टॅप जेस्चर कसे जोडायचे, आणि `Slider` कंट्रोल याबद्दल आपण शिकणार आहोत.

परिणाम:

![Color](../../Resource/018_color.png)

## रंग दाखवणे

सुरुवातीला, व्ह्यूमध्ये एक रंग दाखवूया.

SwiftUI मध्ये, `Color` फक्त रंग दाखवत नाही, तर तो एक व्ह्यू म्हणूनही दाखवता येतो:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
            .ignoresSafeArea()
    }
}
```

इथे `Color.red` लाल रंगाचा एक व्ह्यू दर्शवतो. `.ignoresSafeArea()` रंगाचा व्ह्यू संपूर्ण स्क्रीनवर पसरवतो, त्यामुळे तो खऱ्या फिल लाइटसारखा दिसतो.

परिणाम:

![Color](../../Resource/018_color1.png)

### रंगांची array आणि index

आत्ता फक्त एकच रंग दाखवला जात आहे. पण फिल लाइट सहसा फक्त एकाच रंगाची नसते. ती निळा, पिवळा, जांभळा, पांढरा आणि इतर रंगही दाखवू शकते.

आपल्याला स्क्रीनवर टॅप केल्यावर वेगवेगळ्या रंगांमध्ये बदल व्हावा असे वाटते. हे रंग आपण एका array मध्ये ठेवून एकत्र manage करू शकतो:

```swift
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
```

Array "एकाच प्रकारच्या डेटाच्या गटाला" साठवण्यासाठी योग्य असते. इथे array मधील प्रत्येक element हा `Color` आहे.

जर आपल्याला एखादा ठराविक रंग दाखवायचा असेल, तर आपण index वापरू शकतो:

```swift
colors[0]
```

याचा अर्थ array मधील `0` index वरील रंग वाचणे, म्हणजे पहिला रंग.

आता कोड असा लिहिता येतो:

```swift
struct ContentView: View {
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[0]
            .ignoresSafeArea()
    }
}
```

यामुळे स्क्रीनवर array मधील पहिला रंग, म्हणजे लाल, दिसेल.

### index वापरून रंग नियंत्रित करणे

जर आपल्याला वेगवेगळ्या रंगांमध्ये बदल करायचा असेल, तर index ठराविक लिहिण्याऐवजी तो manage करण्यासाठी एक variable लागेल.

Index साठवण्यासाठी आपण `@State` वापरून एक variable जाहीर करू शकतो:

```swift
@State private var index = 0
```

इथे `index` हा सध्याच्या रंगाचा index दर्शवतो.

जेव्हा `index` बदलतो, तेव्हा SwiftUI इंटरफेस पुन्हा calculate करते आणि दाखवलेला content update करते.

त्यानंतर जुने `colors[0]` बदलून हे लिहूया:

```swift
colors[index]
```

अशा प्रकारे, व्ह्यूमध्ये दिसणारा रंग `index` वरून ठरवला जाईल.

आता कोड असा होतो:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        colors[index]
            .ignoresSafeArea()
    }
}
```

`index` बदलला की `colors[index]` सुद्धा वेगळा रंग दाखवेल.

उदाहरणार्थ:

```swift
@State private var index = 0
colors[index]   // Color.red

@State private var index = 1
colors[index]   // Color.blue
```

एक गोष्ट लक्षात ठेवण्यासारखी आहे: `index` array च्या सर्वात मोठ्या index पेक्षा जास्त जाऊ नये, नाहीतर out-of-range error येईल.

## टॅप जेस्चर

आता आपण `index` नुसार वेगवेगळे रंग दाखवू शकतो, पण अजून टॅप करून रंग बदलू शकत नाही.

मागील “Quote Carousel” धड्यात आपण quote बदलण्यासाठी `Button` वापरले होते.

पण यावेळी, आपण “पूर्ण रंगाच्या भागावर टॅप” करून रंग बदलू इच्छितो, म्हणून `onTapGesture` अधिक योग्य आहे.

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index += 1
                }
        }
    }
}
```

जेव्हा आपण रंगाच्या व्ह्यूवर टॅप करतो, तेव्हा हा कोड चालतो:

```swift
index += 1
```

याचा अर्थ `index` मध्ये `1` ने वाढ करणे. Index वाढल्यानंतर `colors[index]` array मधील पुढचा रंग दाखवेल.

### `onTapGesture`

`onTapGesture` हा एक gesture modifier आहे, जो एखाद्या व्ह्यूमध्ये टॅप action जोडतो.

मूलभूत वापर:

```swift
.onTapGesture {
    // code
}
```

उदाहरण:

```swift
Color.red
    .onTapGesture {
        print("Click color")
    }
```

या लाल व्ह्यूवर टॅप केल्यावर, braces मधील कोड चालतो आणि console मध्ये हे output मिळते:

```swift
Click color
```

`onTapGesture` द्वारे, एखाद्या व्ह्यूवर टॅप झाल्यावर काय व्हायला हवे हे आपण ठरवू शकतो.

### `Button` पासून फरक

यापूर्वी आपण `Button` व्ह्यू शिकलो होतो. `Button` आणि `onTapGesture` हे दोन्ही टॅप actions हाताळू शकतात, पण त्यांचे वापराचे प्रसंग पूर्णपणे सारखे नाहीत.

`onTapGesture` “आधीच अस्तित्वात असलेल्या व्ह्यूला टॅपची क्षमता जोडण्यासाठी” अधिक योग्य आहे, जसे `Color`, `Image`, `Text` किंवा इतर सामान्य व्ह्यू.

दुसरीकडे, `Button` तेव्हा अधिक योग्य असतो जेव्हा आपण “Confirm”, “Submit” किंवा “Delete” सारखा एखादा स्पष्ट बटण दाखवू इच्छितो.

या फिल लाइट अॅपमध्ये, आपल्याला रंग बदलण्याचे फंक्शन अधिक सोपे हवे आहे. पूर्ण रंगाच्या भागावर टॅप केल्यावर रंग बदलावा, म्हणून येथे `onTapGesture` हा चांगला पर्याय आहे.

## index ची समस्या

आता आपण स्क्रीनवर टॅप करून वेगवेगळ्या रंगांमध्ये बदल करू शकतो.

पण येथे एक महत्त्वाची समस्या आहे: **index array च्या मर्यादेबाहेर जाऊ शकतो**.

उदाहरण:

```swift
@State private var index = 4
let colors = [Color.red, Color.blue, Color.yellow, Color.purple]

colors[index]   // Error
```

जर आपण स्क्रीनवर सतत टॅप करत राहिलो, तर `index` शेवटी `4` होईल, आणि तेव्हा “index out of range” error येईल.

याचे कारण असे की `colors` array मध्ये `4` elements आहेत, पण indexing `0` पासून सुरू होते, म्हणून वैध index range `0 - 3` आहे, `4` नाही.

जर आपण `colors[4]` वापरले, तर “index out of range” error येईल.

सध्याच्या कोडमध्ये, प्रत्येक टॅप `index` ला आपोआप `1` ने वाढवतो. आपण हे handle केले नाही, तर ते शेवटी मर्यादा ओलांडेलच.

म्हणून स्क्रीनवर टॅप केल्यावर आपल्याला index तपासावा लागेल: जर तो शेवटचा रंग असेल तर पहिल्या रंगावर परत जा; नाहीतर `1` ने वाढवत राहा.

हे आपण `if` statement ने करू शकतो:

```swift
.onTapGesture {
    if index == colors.count - 1 {
        index = 0
    } else {
        index += 1
    }
}
```

या कोडमध्ये `colors.count` म्हणजे array मधील elements ची संख्या.

सध्याच्या array मध्ये 4 रंग आहेत, म्हणून:

```swift
colors.count // 4
```

पण सर्वात मोठा index `4` नसून `3` आहे, कारण indexing `0` पासून सुरू होते.

म्हणून शेवटचा index असा लिहिला जातो:

```swift
colors.count - 1
```

म्हणजे:

```swift
4 - 1 = 3
```

या logic चा अर्थ असा: जर सध्याचा index आधीच शेवटच्या रंगाकडे दाखवत असेल, तर index ला `0` वर reset करा; नाहीतर त्याला `1` ने वाढवा.

या प्रकारे रंग चक्राकार बदलत राहतील.

### index logic अजून सोपी करणे

जर आपण कोड अजून संक्षिप्त करायचा असेल, तर ternary operator सुद्धा वापरू शकतो:

```swift
.onTapGesture {
    index = index == colors.count - 1 ? 0 : index + 1
}
```

या कोडचा अर्थ असा: जर `index == colors.count - 1` खरे असेल, तर `0` परत द्या. नाहीतर `index + 1` परत द्या.

शेवटी, हा result पुन्हा `index` ला assign केला जातो.

आता आपण रंग बदलण्याचा effect लागू करू शकतो.

पूर्ण कोड:

```swift
struct ContentView: View {
    @State private var index = 0
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        VStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
        }
    }
}
```

आता आपण स्क्रीनवर टॅप करून वेगवेगळ्या रंगांमध्ये बदल करू शकतो. एक मूलभूत फिल लाइट अॅप तयार झाले आहे.

## रंगाचे नाव दाखवणे

आपण रंगांशी संबंधित आणखी एक text group जोडू शकतो, त्यामुळे रंग बदलला की स्क्रीनवर सध्याच्या रंगाचे नावही दिसेल.

उदाहरणार्थ:

- लाल असेल तर `Red`
- निळा असेल तर `Blue`
- पिवळा असेल तर `Yellow`
- जांभळा असेल तर `Purple`

इथेही आपण रंगांची नावे साठवण्यासाठी array वापरू शकतो:

```swift
let colorsName = ["Red", "Blue", "Yellow", "Purple"]
```

या array मधील text चा क्रम, रंगांच्या array मधील रंगांच्या क्रमाशी अगदी जुळणारा असायला हवा.

त्यानंतर, सध्याच्या index नुसार रंगाचे नाव दाखवण्यासाठी आपण `Text` वापरू शकतो:

```swift
Text(colorsName[index])
```

`Text` `index` नुसार सध्याच्या रंगाचे नाव दाखवते.

`Text` चे स्वरूप सुधारण्यासाठी modifiers वापरा:

```swift
Text(colorsName[index])
    .font(.title)
    .fontWeight(.bold)
    .foregroundStyle(Color.white)
```

यामुळे `Text` पांढऱ्या रंगात, मोठ्या title size मध्ये आणि bold font weight मध्ये दिसेल.

आता आपल्याकडे full-screen `Color` व्ह्यू आहे. जर आपल्याला `Text` हा `Color` व्ह्यूच्या वर दिसायला हवा असेल, तर दोन्ही एकमेकांवर दाखवण्यासाठी `ZStack` layout container वापरावा लागेल.

```swift
ZStack {
    Color
    Text
}
```

म्हणून कोड असा होतो:

```swift
struct ContentView: View {
    @State private var index = 0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
        }
    }
}
```

या प्रकारे background मध्ये रंगाचा व्ह्यू असेल आणि त्याच्या वर text व्ह्यू दिसेल.

परिणाम:

![Color](../../Resource/018_color2.png)

एक गोष्ट लक्षात ठेवण्यासारखी आहे की `ZStack` मध्ये नंतर लिहिलेला व्ह्यू सामान्यतः पुढे दिसतो. जर `Text` ला `Color` च्या आधी लिहिले, तर नंतरचा `Color` व्ह्यू `Text` झाकू शकतो.

## ब्राइटनेस नियंत्रित करणे

आता आपण वेगवेगळे रंग बदलू शकतो, पण फिल लाइटचे आणखी एक महत्त्वाचे वैशिष्ट्य आहे: **ब्राइटनेस समायोजित करणे**.

SwiftUI मध्ये, आपण `brightness` modifier वापरून व्ह्यूची ब्राइटनेस समायोजित करू शकतो.

उदाहरण:

```swift
.brightness(1)
```

आपण असे लिहू शकतो:

```swift
colors[index]
    .brightness(0.5)
```

यामुळे सध्याचा रंग अधिक चमकदार दिसतो आणि फिल लाइटच्या परिणामास अधिक जवळचा वाटतो.

ब्राइटनेसची range `0 - 1` आहे. `0` म्हणजे मूळ रंग तसाच ठेवणे, आणि value `1` च्या जितकी जवळ असेल तितका रंग अधिक चमकदार होईल. `1` म्हणजे सर्वात चमकदार पांढरा परिणाम.

जरी आपण कोडमध्ये `brightness` नियंत्रित करू शकतो, तरीही वापरकर्ता ते थेट स्वतः नियंत्रित करू शकत नाही.

म्हणून आपल्याला एक drag करता येणारे control जोडावे लागेल: `Slider`.

## `Slider` व्ह्यू

SwiftUI मध्ये, `Slider` हा एक control आहे जो एका ठराविक range मधील value निवडण्यासाठी वापरला जातो. Apple याचे वर्णन “bounded linear range मधून value निवडण्यासाठीचा control” असे करते.

मूल वापर:

```swift
Slider(value: $value, in: 0...1)
```

पॅरामीटर्सचे स्पष्टीकरण:

1. `value: $value`: `Slider` ला एका variable शी bind करावे लागते.

    स्लायडर drag केल्यावर variable ची value सुद्धा त्याच वेळी बदलते. आणि जर variable बदलला, तर slider सुद्धा update होतो.

    हे आपण आधी शिकलेल्या `TextField` सारखेच आहे. दोन्हीही “control ला variable शी bind” करतात.

    binding दाखवण्यासाठी bind केलेल्या variable च्या आधी `$` चिन्ह लावावे लागते.

2. `in: 0...1`: हा parameter slider ची value range दर्शवतो.

    येथे `0...1` म्हणजे minimum value `0` आहे आणि maximum value `1` आहे.

    जेव्हा slider पूर्णपणे डावीकडे drag केला जातो, तेव्हा bound variable `0` च्या जवळ असतो; आणि पूर्णपणे उजवीकडे drag केल्यावर तो `1` च्या जवळ असतो.

उदाहरण:

```swift
@State private var value = 0.0

HStack(spacing:20) {
    Text("0")
        .foregroundStyle(.gray)
    Slider(value: $value, in: 0...1)
        .frame(width: 100)
    Text("1")
}
```

`Slider` हा `value` variable शी bind आहे. स्लायडर drag केल्यावर `value` variable ची value सुद्धा त्याच वेळी बदलते.

दिसणे:

![Slider](../../Resource/018_slider.png)

`Slider` डावीकडे नेल्यावर bound `value` `0` होते. उजवीकडे नेल्यावर ते `1` होते.

### value range

`Slider` ची value range स्थिर नसते. ती अशाही प्रकारे लिहिता येते:

```swift
0...100
```

किंवा इतर range मध्ये.

पण या फिल लाइट अॅपमध्ये, आपल्याला ब्राइटनेस नियंत्रित करायची असल्याने `0...1` हीच सर्वात योग्य निवड आहे.

## `Slider` वापरून ब्राइटनेस नियंत्रित करणे

आता आपल्याला `Slider` ला `brightness` शी जोडायचे आहे.

सुरुवातीला, ब्राइटनेसची value साठवण्यासाठी एक variable तयार करा:

```swift
@State private var slider = 0.0
```

इथे `0.0` ही `Double` प्रकारची value आहे.

कारण `Slider` सहसा numeric type शी bind असतो, आणि येथे आपल्याला त्यात continuous बदल हवा आहे, म्हणून `Double` अधिक योग्य आहे. तसेच `brightness` फक्त `Double` प्रकारची value स्वीकारतो.

नंतर ही value `brightness` ला द्या:

```swift
colors[index]
    .brightness(slider)
```

जेव्हा `slider == 0` असते, तेव्हा रंग त्याच्या default स्थितीत राहतो. `slider` जितका `1` च्या जवळ जाईल, तितका रंग अधिक चमकदार दिसेल.

### `Slider` control जोडणे

यानंतर, हा variable बदलण्यासाठी `Slider` control जोडा:

```swift
Slider(value: $slider, in: 0...1)
```

स्लायडर बदलल्यावर `slider` ची value सुद्धा बदलते, आणि `brightness(slider)` त्याच वेळी ब्राइटनेस update करते.

हे SwiftUI मधील “variable व्यूला चालवतो” या कल्पनेचे खूप सामान्य उदाहरण आहे.

### `Slider` चे स्वरूप समायोजित करणे

डिफॉल्टनुसार, `Slider` उपलब्ध असलेली रुंदी वापरतो.

आपण त्याला ठरलेली रुंदी देऊ शकतो:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
```

त्यानंतर, तो अधिक स्पष्ट दिसण्यासाठी काही modifiers जोडा:

```swift
Slider(value: $slider, in: 0...1)
    .frame(width: 200)
    .padding(20)
    .background(Color.white)
    .cornerRadius(10)
```

यामुळे slider ला पांढरा background आणि गोलाकार कोपरे मिळतात, त्यामुळे तो `Color` व्ह्यूवर अधिक स्पष्टपणे दिसतो.

शेवटी, तो स्क्रीनच्या खालच्या भागात ठेवा.

आपण आधीच `ZStack` वापरत असल्यामुळे, त्यात `VStack` ठेवून `Spacer()` वापरून `Slider` ला खाली ढकलू शकतो.

## पूर्ण कोड

```swift
struct ContentView: View {
    @State private var index = 0
    @State private var slider = 0.0
    let colorsName = ["Red", "Blue", "Yellow", "Purple"]
    let colors = [Color.red, Color.blue, Color.yellow, Color.purple]
    var body: some View {
        ZStack {
            colors[index]
                .brightness(slider)
                .ignoresSafeArea()
                .onTapGesture {
                    index = index == colors.count - 1 ? 0 : index + 1
                }
            Text(colorsName[index])
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            VStack {
                Spacer()
                Slider(value: $slider, in: 0...1)
                    .frame(width: 200)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
```

परिणाम:

![Color](../../Resource/018_color.png)

## सारांश

आधी शिकलेल्या ज्ञानाचा आणि रंग, array सारख्या मूलभूत संकल्पनांचा उपयोग करून, आपण एक खूपच मनोरंजक फिल लाइट अॅप तयार केले.

या फिल लाइट अॅपमुळे, `brightness` वापरून ब्राइटनेस समायोजित करणे, `onTapGesture` वापरून व्ह्यूंना टॅप action जोडणे, आणि `Slider` control वापरणे आपण शिकलो.

रंग बदलण्यासाठी आपण `Color` व्ह्यूला `onTapGesture` जोडले. `brightness` manage करणाऱ्या variable मध्ये बदल करण्यासाठी आपण `Slider` control देखील वापरले, जे “variable व्यूला चालवतो” याचे आणखी एक उदाहरण आहे.

आपण ternary operator चेही पुनरावलोकन केले, व्ह्यूंना एकमेकांवर ठेवण्यासाठी `ZStack` वापरले, आणि एकाच प्रकारच्या डेटाच्या गटाला manage करण्यासाठी arrays वापरल्या. यामुळे arrays आणि index यांविषयीची आपली समज अधिक गहिरी होते, विशेषतः out-of-range errors टाळण्याच्या व्यावहारिक प्रश्नात.

हे उदाहरण फार क्लिष्ट नाही, पण ते आपण आधी शिकलेल्या अनेक मूलभूत कल्पनांना जोडते. जेव्हा या संकल्पना एका छोट्या प्रत्यक्ष प्रोजेक्टमध्ये वापरल्या जातात, तेव्हा प्रत्येक संकल्पना कशासाठी उपयोगी आहे हे अधिक सहज समजते.

### वास्तविक वापराची परिस्थिती

कल्पना करा, आपण एक जुना iPhone टेबलावर ठेवता आणि आपणच बनवलेल्या फिल लाइट अॅपने प्रकाशाचा रंग नियंत्रित करता. तो एक खूप छान अनुभव असेल.

App Store मध्ये अनेक “फिल लाइट” अॅप्स आहेत, आणि तीही फार क्लिष्ट वाटत नाहीत.

![AppStore](../../Resource/018_appStore.PNG)

आपण साध्या अॅप्सपासून सुरुवात करू शकतो आणि ती App Store वर प्रसिद्ध करण्याचा प्रयत्न करू शकतो. यामुळे विकासाविषयीची आपली आवड वाढतेच, पण आपली प्रगतीही नोंदवली जाते.

### धड्यानंतरचा सराव

हे फिल लाइट अॅप पुढे कसे वाढवता येईल याचा विचार आपण करत राहू शकता, उदाहरणार्थ:

- अधिक रंग जोडणे
- सध्याची ब्राइटनेस value दाखवणे
- खालील slider भागाचा डिझाइन अधिक चांगला करणे

जेव्हा आपण हे ज्ञान प्रत्यक्षात वापरायला सुरुवात कराल, तेव्हा आपल्याला समजेल की आपण शिकणारी प्रत्येक संकल्पना ही प्रत्यक्षात अॅप तयार करण्याचे एक साधन आहे.

आपण जितकी अधिक साधने आत्मसात करू, तितकी अधिक वैशिष्ट्ये तयार करू शकू.
