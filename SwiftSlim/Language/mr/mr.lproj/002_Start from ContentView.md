# ContentView पासून सुरुवात

## पाठमालिकेपूर्वीची तयारी

या पाठात आपण `ContentView.swift` file पासून सुरुवात करून SwiftUI ची मूलभूत रचना प्रणालीबद्ध पद्धतीने समजून घेऊ. यात पुढील गोष्टींचा समावेश आहे:

- comments
- View structure
- VStack / HStack / ZStack layouts
- SF Symbols icons
- view modifiers
- preview code `#Preview`

सुरुवातीला, आधी तयार केलेला Xcode project शोधा आणि `.xcodeproj` file वर double-click करा.

डाव्या बाजूच्या Navigator navigation area मधून `ContentView.swift` file निवडा.

टीप: प्रत्येक वेळी project उघडताना Canvas मध्ये `"Preview paused"` दिसू शकते. Refresh button click केल्यास preview परत येईल.

![Swift](../../RESOURCE/002_view7.png)

## ContentView ची ओळख

ContentView code:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
```

जरी code कमी असले तरी त्यात SwiftUI ची core structure समाविष्ट आहे.

### 1. Comment

File च्या वरच्या भागात:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

हे file comment आहे. हे file information नोंदवण्यासाठी वापरले जाते, ज्यात file name, project name, creator आणि creation time यांचा समावेश असतो.

Swift मध्ये single-line comment करण्यासाठी `//` वापरतात:

```swift
// ही comment आहे
```

Comments code readability वाढवतात आणि developer ला code logic समजण्यास मदत करतात.

प्रत्यक्ष development मध्ये code कधीकधी खूप अवघड वाटू शकतो. जर comments लिहिल्या नाहीत, तर तीन दिवसांनी स्वतःचाच code समजणार नाही अशी वेळ येऊ शकते.

म्हणून code लिहिताना स्वतःहून comments add करणे ही चांगली development सवय आहे. Comments वापरून code logic नोंदवून ठेवल्यास पुढील maintenance सोपे होते.

**Code तात्पुरते disable करणे**

Comments वापरून आपण code तात्पुरते disable देखील करू शकतो, ज्यामुळे problem troubleshoot करायला मदत होते.

उदाहरणार्थ:

```
A
B
C
```

`A`, `B`, `C` हे तीन code sections आहेत. त्यापैकी एकात error आहे. आपण comments वापरून तपासू शकतो.

पहिले `A` ला comment द्या:

```swift
// A
B
C
```

जर `A` comment केल्यानंतर code normal झाले, तर problem `A` मध्ये आहे हे समजते.

जर `A` comment केल्यानंतरही समस्या राहिली, तर आपण `B` comment करून पाहू शकतो. अशा प्रकारे problem असलेला code शोधता येतो.

Development च्या प्रक्रियेत अनेक problems येतात. बऱ्याच वेळा comments वापरून problem ची कारणे शोधावी लागतात. यामुळे bug कुठे आहे हे locate करणे सोपे होते.

Xcode मध्ये तुम्ही shortcut वापरू शकता:

```
Command ⌘ + /
```

यामुळे comments पटकन add किंवा remove करता येतात.

### 2. SwiftUI framework import करणे

```swift
import SwiftUI
```

हा code SwiftUI framework import करतो.

SwiftUI मधील `View`, `Text`, `Image`, `VStack` अशा types या framework मधून येतात.

जर SwiftUI framework import केले नाही, तर Xcode error दाखवेल:

```
Cannot find type 'View' in scope
```

याचा अर्थ compiler ला `View` type ओळखता येत नाही.

### 3. View structure

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ही View structure पहिल्यांदा पाहताना थोडी unfamiliar वाटू शकते, कारण यात `struct`, `View`, `var`, `body`, `some` अशा keywords आहेत.

आपण अजून हे keywords शिकलो नाही. आत्ता एवढे समजले तरी पुरेसे आहे की हा code `ContentView` नावाचा एक View तयार करतो.

तुम्ही `View` ला एक drawing board म्हणून समजू शकता. त्या drawing board वर आपण काहीतरी तयार करतो, आणि ते तयार करण्याचे tool म्हणजे SwiftUI.

उदाहरणार्थ:

![Swift](../../RESOURCE/002_view.png)

वर दाखवलेली तीन pages प्रत्यक्षात तीन वेगवेगळे Views आहेत.

```swift
struct View1: View {
    var body: some View {
        ...
    }
}
struct View2: View {
    var body: some View {
        ...
    }
}
struct View3: View {
    var body: some View {
        ...
    }
}
```

जेव्हा आपण SwiftUI वापरून App तयार करतो, तेव्हा प्रत्येक page प्रत्यक्षात एक View असतो.

### 4. SwiftUI code

View च्या आत दिसणारा SwiftUI code:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

हा SwiftUI code एक vertical layout दर्शवतो, ज्यात एक icon आणि एक text दिसतो.

![Swift](../../RESOURCE/002_view1.png)

#### VStack layout

```swift
VStack { }  // vertical layout
```

`VStack` म्हणजे vertical layout container. त्यातील views वरून खाली मांडले जातात.

![Swift](../../RESOURCE/002_view8.png)

SwiftUI मधील सामान्य तीन layouts:

- `VStack` —— vertical arrangement
- `HStack` —— horizontal arrangement
- `ZStack` —— overlay arrangement (Z-axis)

```swift
HStack { }  // horizontal arrangement
ZStack { }  // overlay arrangement
```

प्रत्येक layout च्या arrangement चे चित्र:

![Swift](../../RESOURCE/002_view2.png)

उदाहरणार्थ, `HStack` वापरून horizontal arrangement:

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

आता globe icon आणि text horizontal पद्धतीने दिसतात.

![Swift](../../RESOURCE/002_view3.png)

जेव्हा horizontal arrangement हवा असेल तेव्हा `HStack` वापरतो. जेव्हा overlay arrangement हवा असेल तेव्हा `ZStack` वापरतो.

#### Image आणि SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

हा code एक globe icon दाखवतो, आणि हा icon Apple च्या SF Symbols icon system मधून येतो.

![Swift](../../RESOURCE/002_view9.png)

या code चा अर्थ असा: एक globe icon दाखवा, मोठ्या आकारात, accent color सह.

आपण globe icon शिवाय इतर icons देखील दाखवू शकतो.

उदाहरणार्थ backpack icon:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**इतर icons कसे दाखवायचे?**

यासाठी Apple ने अधिकृतपणे दिलेली system icon library म्हणजे SF Symbols वापरावी लागते.

Apple Developer website उघडा आणि [SF Symbols](https://developer.apple.com/sf-symbols/) download करा.

![Swift](../../RESOURCE/002_sf.png)

SF Symbols App उघडा.

![Swift](../../RESOURCE/002_sf1.png)

डाव्या बाजूला symbol categories दिसतात आणि उजव्या बाजूला संबंधित icons दिसतात.

एखाद्या icon वर right-click करून `"Copy Name"` निवडा; तेच त्या icon चे string नाव असते.

उदाहरणार्थ:

```
"globe"
"backpack"
"heart"
```

हे copy केलेले icon name `Image(systemName:)` मध्ये ठेवले की वेगवेगळे icons दिसू शकतात.

टीप: प्रत्येक SF Symbols icon साठी minimum supported system version असते. System version खूप जुनी असल्यास icon कदाचित दिसणार नाही. त्याची compatibility माहिती SF Symbols App मध्ये तपासावी.

#### Modifiers

SwiftUI मध्ये modifier हा view चे appearance किंवा behavior बदलण्यासाठी वापरला जाणारा method आहे.

Modifier ला कपड्यांसारखे समजू शकता. वेगवेगळे कपडे घातल्यावर रूप वेगळे दिसते.

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

`imageScale` आणि `foregroundStyle` हे `Image` view चे modifiers आहेत. ते `Image` चा content न बदलता, त्याचे appearance बदलतात.

**1. imageScale**

```swift
.imageScale(.large)
```

हा SF Symbols icon चा size नियंत्रित करतो:

- `.small`
- `.medium`
- `.large`

![Swift](../../RESOURCE/002_view11.png)

वेगवेगळे options बदलून SF Symbols icons वेगवेगळ्या sizes मध्ये दाखवता येतात.

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

`foregroundStyle` foreground color नियंत्रित करण्यासाठी वापरले जाते.

`.tint` म्हणजे current environment मधील accent color. Default ने iOS मध्ये ते blue असते.

जर foreground color red करायचा असेल:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text view

`Text` हा text view आहे, जो strings दाखवण्यासाठी वापरला जातो.

```swift
Text("Hello, world!")
```

उदाहरणार्थ, माझे नाव दाखवण्यासाठी:

```swift
Text("FangJunyu")
```

टीप: strings नेहमी `""` double quotes मध्ये असावेत.

तुम्ही स्वतःचे नाव, फोन नंबर इत्यादी दाखवून पाहू शकता.

#### padding

SwiftUI मध्ये `padding` हा view content आणि त्याच्या boundary यांच्यामध्ये extra blank space देण्यासाठी वापरला जातो. याला “inner spacing” किंवा “content inset” असेही समजू शकतो.

```swift
HStack {
    ...
}
.padding()
```

वरील code `HStack` view ला system default padding देतो.

**padding म्हणजे काय?**

`padding` म्हणजे "view च्या content आणि त्याच्या boundary मधील मोकळी जागा".

खालील चित्रात, blue रंगाच्या `HStack` ला padding दिल्यावर blue area आतल्या बाजूला shrink झाल्यासारखा दिसतो; म्हणजे तो "एक फेरीने लहान" झाल्यासारखा वाटतो.

![Swift](../../RESOURCE/002_view6.png)

**Default padding**

`padding()` modifier default ने system recommended standard spacing वापरते.

```swift
.padding()
```

वेगवेगळ्या platforms आणि contexts मध्ये ही value बदलू शकते. उदाहरणार्थ:

- iOS मध्ये साधारणपणे `16 pt`
- macOS किंवा watchOS मध्ये system standard spacing वेगळी असू शकते; ती संबंधित platform च्या design guideline वर अवलंबून असते

**Custom padding**

एखाद्या view साठी स्वतंत्र directions मध्ये padding देखील सेट करू शकतो.

1. Single direction

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

Direction चे अर्थ:

- `.top`: वरची padding
- `.bottom`: खालची padding
- `.leading`: पुढील बाजू
- `.trailing`: मागील बाजू

![Swift](../../RESOURCE/002_view12.png)

टीप: `leading` आणि `trailing` या language direction नुसार आपोआप adapt होतात. उदाहरणार्थ Arabic सारख्या RTL environment मध्ये ते उलट होतात.

2. Multiple directions

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Array वापरून एकाच वेळी अनेक directions specify करता येतात. Array चा तपशील पुढील tutorials मध्ये येईल; सध्या ही syntax ओळखून ठेवली तरी पुरेसे आहे.

3. Horizontal किंवा vertical directions

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

हे पुढीलप्रमाणेच आहे:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**Padding काढून टाकणे**

जर काहीही padding नको असेल, तर `.padding(0)` वापरू शकता:

```swift
.padding(0)
```

किंवा modifier थेट delete करू शकता:

```swift
// .padding()
```

### 6. Preview code

```swift
#Preview {
    ContentView()
}
```

हा code Canvas मध्ये `ContentView` preview तयार करतो.

टीप: `#Preview` ही Swift 5.9 / Xcode 15 मध्ये आलेली नवीन syntax आहे. त्याआधी `PreviewProvider` structure वापरली जायची.

**Preview comment केल्यास काय होईल?**

जर `Preview` comment केले:

```swift
// #Preview {
//    ContentView()
// }
```

Canvas मध्ये render होणारे content दिसणार नाही.

![Swift](../../RESOURCE/002_xcode.png)

म्हणजेच Canvas मध्ये preview view दाखवायचे की नाही हे `#Preview` नियंत्रित करते.

Xcode मध्ये SwiftUI view preview करायची असल्यास `#Preview` code add करावी. Preview नको असल्यास `#Preview` comment किंवा delete करू शकता.

## सारांश

`ContentView.swift` file मध्ये code फारसा नसला तरी त्यात SwiftUI चे अनेक core concepts समाविष्ट आहेत. Beginners साठी हा code सुरुवातीला अनोळखी वाटू शकतो. पण त्याची structure वेगवेगळी करून पाहिल्यास SwiftUI ची एक प्राथमिक समज तयार होते.

या पाठीतील content एकदा पुन्हा पाहूया. आपण सुरुवातीला `//` comment शिकलो; त्याद्वारे code logic समजावता येते किंवा code तात्पुरते disable करता येते.

त्यानंतर, SwiftUI file मध्ये SwiftUI framework import करणे आवश्यक आहे हे समजले:

```swift
import SwiftUI
```

Framework import केले नाही तर compiler ला `View` सारखे types ओळखता येणार नाहीत.

यानंतर SwiftUI view ची मूलभूत रचना समजली:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

इथे `ContentView` हे view चे नाव आहे.

आपण तीन सामान्य layout containers शिकलो: `VStack` (vertical arrangement), `HStack` (horizontal arrangement), आणि `ZStack` (overlay arrangement).

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

या code मध्ये एक vertical arrangement container दाखवला जातो, आणि container च्या आत एक icon आणि एक text दिसतो.

`Image` SF Symbols icons दाखवू शकतो, आणि modifiers वापरून icon चा आकार आणि रंग नियंत्रित करता येतो.

`Text` view text content दाखवतो.

`padding` म्हणजे margin सारखा spacing, जो view च्या भोवती transparent जागा देतो.

शेवटी `#Preview` preview view असते, जी Canvas मध्ये preview दाखवते.

### पाठमालिकेनंतरचा सराव

Beginners साठी या पाठीतील content थोडे complex वाटू शकते. पुढील practice करून तुम्ही या concepts बद्दलची समज अजून मजबूत करू शकता:

- SF Symbols icon चे नाव बदला
- icon चा foreground color काळा करा
- `VStack` ला `HStack` मध्ये बदला
- `Image` किंवा `Text` comment करून preview view मधील बदल निरीक्षण करा

### छोटासा बोनस: Code Completion

Code टाइप करताना, तुम्ही कदाचित लक्षात घेतले असेल की Xcode उपलब्ध options ची list आपोआप दाखवतो.

उदाहरणार्थ, `imageScale` modifier edit करताना:

```swift
.imageScale(.)
```

Xcode उपलब्ध options दाखवतो:

![Swift](../../RESOURCE/002_view10.png)

याला code completion mechanism म्हणतात. हे type inference आणि enum member suggestions वर आधारित असते; त्यामुळे typing speed वाढते आणि चुका कमी होतात.

पुढील पाठमालिकेत आपण `enum` औपचारिकरीत्या शिकू. सध्या याची फक्त साधी ओळख म्हणून हे समजून घ्या.
