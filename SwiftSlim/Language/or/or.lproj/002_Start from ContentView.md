# ContentView ଠାରୁ ଆରମ୍ଭ

## ପାଠ ପୂର୍ବର ତୟାରି

ଏହି ପାଠରେ, ଆମେ ContentView.swift ଫାଇଲ୍ ଠାରୁ ଆରମ୍ଭ କରି SwiftUI ର ମୌଳିକ ଗଠନକୁ ପଦ୍ଧତିଗତ ଭାବରେ ବୁଝିବୁ, ଯାହାରେ ରହିଛି:

- ଟୀକା / Comment
- View ଗଠନ
- VStack / HStack / ZStack layout
- SF Symbols ଆଇକନ
- View modifier（ସଂଶୋଧକ）
- Preview କୋଡ୍ #Preview

ପ୍ରଥମେ, ପୂର୍ବରୁ ତିଆରି କରାଯାଇଥିବା Xcode project କୁ ଖୋଜନ୍ତୁ, ଏବଂ .xcodeproj ଫାଇଲ୍ ଉପରେ ଡବଲ୍-କ୍ଲିକ୍ କରନ୍ତୁ।

ବାମପଟିର Navigator ନାଭିଗେସନ୍ ଅଞ୍ଚଳରେ ContentView.swift ଫାଇଲ୍ ବାଛନ୍ତୁ।

ଧ୍ୟାନ ଦିଅନ୍ତୁ: ପ୍ରତିଥର project ଖୋଲିବା ସମୟରେ, Canvas ରେ "Preview paused" ଦେଖାଯାଇପାରେ। Refresh ବଟନ୍ କ୍ଲିକ୍ କଲେ preview ପୁଣି ଚାଲୁ ହେବ।

![Swift](../../RESOURCE/002_view7.png)

## ContentView କୁ ଚିହ୍ନିବା

ContentView କୋଡ୍:

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
````

କୋଡ୍ ଅଧିକ ନୁହେଁ, କିନ୍ତୁ ଏଥିରେ SwiftUI ର ମୁଖ୍ୟ ଗଠନ ଅନ୍ତର୍ଭୁକ୍ତ ଅଛି।

### 1. ଟୀକା / Comment

ଫାଇଲ୍ ର ଶୀର୍ଷଭାଗ:

```swift
//
//  ContentView.swift
//  SwiftSlimTest
//
//  Created by 方君宇 on 2026/2/23.
//
```

ଏହା ହେଉଛି ଫାଇଲ୍ comment, ଯାହା file ସମ୍ବନ୍ଧୀୟ ସୂଚନା ଲେଖି ରଖିବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ। ଏଥିରେ ଫାଇଲ୍ ନାମ, ପ୍ରକଳ୍ପ ନାମ, ସୃଷ୍ଟିକର୍ତ୍ତା ଏବଂ ସୃଷ୍ଟି ସମୟ ଥାଏ।

Swift ରେ single-line comment ପାଇଁ // ବ୍ୟବହାର କରାଯାଏ:

```swift
// ଏହା ହେଉଛି ଟୀକା
```

Comment କୋଡ୍ ର readability ବୃଦ୍ଧି କରେ ଏବଂ developer ଙ୍କୁ code logic ବୁଝିବାରେ ସାହାଯ୍ୟ କରେ।

ବାସ୍ତବ development ରେ, code କେବେ କେବେ ବହୁତ ଜଟିଳ ଏବଂ ବୁଝିବାକୁ କଷ୍ଟକର ହୋଇପାରେ। ଯଦି comment ନ ଲେଖିବେ, ତେବେ ତିନି ଦିନ ପରେ ନିଜ code କୁ ନିଜେ ବୁଝିପାରିବେ ନାହିଁ।

ସେହିପାଇଁ, code ଲେଖିବା ସମୟରେ ସକ୍ରିୟ ଭାବରେ comment ଯୋଡିବା ଗୋଟିଏ ଭଲ development ଅଭ୍ୟାସ। Comment ଦ୍ୱାରା code logic ଲେଖି ରଖିଲେ, ପରବର୍ତ୍ତୀ code maintenance ହେବାରେ ସୁବିଧା ମିଳେ।

**ସାମୟିକ ଭାବରେ କୋଡ୍ ବନ୍ଦ କରିବା**

Comment ଦ୍ୱାରା ଆମେ code କୁ ସାମୟିକ ଭାବରେ ବନ୍ଦ ମଧ୍ୟ କରିପାରୁ, ଯାହା ସମସ୍ୟା ଖୋଜିବାରେ ସାହାଯ୍ୟ କରେ।

ଉଦାହରଣ:

```
A
B
C
```

A、B、C ତିନୋଟି code ଖଣ୍ଡ। ଏଥିରୁ ଗୋଟିଏ ଭୁଲ୍ ଅଛି। ଆମେ ସାମୟିକ ଭାବରେ comment କରି ପରୀକ୍ଷା କରିପାରୁ।

ପ୍ରଥମେ A କୁ comment କରନ୍ତୁ:

```
// A
B
C
```

ଯଦି A କୁ comment କରିଦେବା ପରେ code ସାଧାରଣ ହୋଇଯାଏ, ତେବେ ସମସ୍ୟା A ରେ ଅଛି।

ଯଦି A କୁ comment କରିବା ପରେ ମଧ୍ୟ ସମସ୍ୟା ରହେ, ତେବେ B କୁ comment କରନ୍ତୁ, ଏଭଳି କରି କରି ସମସ୍ୟାର code ଖୋଜନ୍ତୁ।

Development ପ୍ରକ୍ରିୟାରେ ଅନେକ ସମସ୍ୟା ଆସେ। ସାଧାରଣତଃ comment କରି କାରଣ ଖୋଜିବାକୁ ପଡେ। ଏହା ସମସ୍ୟା code କୁ ଚିହ୍ନଟ କରି BUG ଖୋଜିବାରେ ସାହାଯ୍ୟ କରେ।

Xcode ରେ, ନିମ୍ନଲିଖିତ shortcut ବ୍ୟବହାର କରିପାରିବେ:

```
Command ⌘ + /
```

ତୁରନ୍ତ comment ଯୋଡିବା କିମ୍ବା ହଟାଇବା ପାଇଁ।

### 2. SwiftUI framework କୁ import କରିବା

```swift
import SwiftUI
```

ଏହି code ର ଅର୍ଥ ହେଉଛି SwiftUI framework କୁ import କରାଯାଉଛି।

SwiftUI ର View、Text、Image、VStack ଇତ୍ୟାଦି type ସବୁ ଏହି framework ଠାରୁ ଆସିଥାଏ।

ଯଦି SwiftUI framework import କରାଯାଇନାହିଁ, Xcode ଏହି error ଦେବ:

```
Cannot find type 'View' in scope
```

ଏହାର ଅର୍ଥ compiler, View type କୁ ଚିହ୍ନିପାରୁ ନାହିଁ।

### 3. View ଗଠନ

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ପ୍ରଥମଥର ଏହି View structure ଦେଖିଲେ ଅଜଣା ଲାଗିପାରେ, କାରଣ ଏଥିରେ struct、View、var、body、some ଭଳି keyword ଅଛି।

ଆମେ ଏପର୍ଯ୍ୟନ୍ତ ଏହି keyword ଗୁଡ଼ିକୁ ଶିଖିନାହୁଁ। ଏବେ ପାଇଁ ଏତେ ବୁଝିଲେ ଚାଲିବ ଯେ, ଏହି code ର ଅର୍ଥ ହେଉଛି ContentView ନାମର ଗୋଟିଏ View ସୃଷ୍ଟି କରାଯାଇଛି।

ଆପଣ View କୁ ଗୋଟିଏ drawing board ବୋଲି ଭାବିପାରନ୍ତି, ଯାହା ଉପରେ ଆମେ ଚିତ୍ର ଆକିପାରୁ। ଏଠାରେ ଚିତ୍ର ଆକିବାର ଉପକରଣ ହେଉଛି SwiftUI।

ଉଦାହରଣ:

![Swift](../../RESOURCE/002_view.png)

ଉପରର ଛବିରେ ତିନୋଟି page ଦେଖାଯାଇଛି, ପ୍ରକୃତରେ ସେଗୁଡ଼ିକ ତିନୋଟି View।

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

ଯେତେବେଳେ ଆମେ SwiftUI ଦ୍ୱାରା App ଡିଭେଲପ କରୁ, ପ୍ରତ୍ୟେକ page ହେଉଛି ଗୋଟିଏ View।

### 4. SwiftUI କୋଡ୍

View ର ଭିତରେ ଥିବା SwiftUI code:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ଏହି SwiftUI code ର ଅର୍ଥ ହେଉଛି ଏହା ଗୋଟିଏ vertical layout, ଯେଉଁଥିରେ ଗୋଟିଏ icon ଏବଂ ଗୋଟିଏ text ଦେଖାଯାଏ।

![Swift](../../RESOURCE/002_view1.png)

#### VStack layout

```swift
VStack { }  // ଉର୍ଦ୍ଧ୍ୱାଧର layout
```

VStack ର ଅର୍ଥ vertical layout container। ଏହାର ଭିତରର view ଗୁଡ଼ିକ ଉପରୁ ତଳକୁ ସଜିଥାଏ।

![Swift](../../RESOURCE/002_view8.png)

SwiftUI ରେ ସାଧାରଣ ତିନି ପ୍ରକାର layout:

* VStack —— ଉର୍ଦ୍ଧ୍ୱାଧର କ୍ରମ
* HStack —— ଅନୁଧ୍ୟାୟୀ କ୍ରମ
* ZStack —— ଓଭରଲାପ୍ / ସ୍ତରୀକୃତ କ୍ରମ（Z ଅକ୍ଷ）

```swift
HStack { }  // ଅନୁଧ୍ୟାୟୀ କ୍ରମ
ZStack { }  // ସ୍ତରୀକୃତ / ଓଭରଲାପ୍ କ୍ରମ
```

ପ୍ରତ୍ୟେକ layout ର ସଜାଣି ଚିତ୍ର:

![Swift](../../RESOURCE/002_view2.png)

ଉଦାହରଣ: HStack ବ୍ୟବହାର କରି horizontal layout।

```swift
HStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ଦେଖିପାରିବେ, globe icon ଏବଂ text ବାମରୁ ଡାହାଣକୁ ସଜିଛି।

![Swift](../../RESOURCE/002_view3.png)

ଯେତେବେଳେ horizontal ସଜାଣି ଦରକାର, HStack ବ୍ୟବହାର କରନ୍ତୁ। ଯେତେବେଳେ overlay / ସ୍ତରୀକୃତ ସଜାଣି ଦରକାର, ZStack ବ୍ୟବହାର କରନ୍ତୁ।

#### Image ଏବଂ SF Symbols

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

ଏହି code ଗୋଟିଏ globe icon ଦେଖାଏ, ଯାହା Apple ର SF Symbols icon system ଠାରୁ ଆସିଛି।

![Swift](../../RESOURCE/002_view9.png)

ଏହି code ର ଅର୍ଥ ହେଉଛି ଗୋଟିଏ globe icon ଦେଖାଇବା, ବଡ ଆକାରରେ, ଏବଂ ରଙ୍ଗ ଭାବେ accent color ବ୍ୟବହାର କରିବା।

ଆମେ କେବଳ globe icon ନୁହେଁ, ଅନ୍ୟ icon ମଧ୍ୟ ଦେଖାଇପାରୁ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଗୋଟିଏ backpack ଦେଖାଇବା:

```swift
Image(systemName: "backpack")
```

![Swift](../../RESOURCE/002_view4.png)

**ଅନ୍ୟ icon କିପରି ଦେଖାଯିବ?**

ଏଥିପାଇଁ Apple ର ଆଧିକାରିକ system icon library SF Symbols ବ୍ୟବହାର କରିବାକୁ ପଡେ।

Apple Developer ର ଆଧିକାରିକ ୱେବସାଇଟ୍ ଖୋଲନ୍ତୁ, ଏବଂ [SF Symbols](https://developer.apple.com/sf-symbols/) ଡାଉନଲୋଡ୍ କରନ୍ତୁ।

![Swift](../../RESOURCE/002_sf.png)

SF Symbols App ଖୋଲନ୍ତୁ।

![Swift](../../RESOURCE/002_sf1.png)

ବାମ ପଟେ symbol category ଥାଏ, ଏବଂ ଡାହାଣ ପଟେ ତାହା ସହିତ ସମ୍ବନ୍ଧିତ icon ଦେଖାଯାଏ।

କୌଣସି icon ଉପରେ ଡାହାଣ-କ୍ଲିକ୍ କରି "拷贝1个名称" ବାଛନ୍ତୁ। ଏହାର ନାମ ହେଉଛି ସେହି string content।

ଉଦାହରଣ:

```
"globe"
"backpack"
"heart"
```

ନକଲ୍ କରାଯାଇଥିବା icon name କୁ Image(systemName:) ଭିତରେ ରଖିଦେଲେ, ଭିନ୍ନ icon ଦେଖାଯିବ।

ଧ୍ୟାନ ଦିଅନ୍ତୁ: ପ୍ରତ୍ୟେକ SF Symbols icon ର ନ୍ୟୁନତମ supported system version ଥାଏ। System version ଅଧିକ ପୁରୁଣା ହେଲେ icon ଦେଖାଯାଇନପାରେ। Compatibility ସୂଚନା SF Symbols App ଭିତରେ ଯାଞ୍ଚ କରିବା ଦରକାର।

#### Modifier

SwiftUI ରେ, modifier ହେଉଛି ଏମିତି ଏକ ପଦ୍ଧତି ଯାହା view ର appearance କିମ୍ବା behavior କୁ ପରିବର୍ତ୍ତନ କରେ।

Modifier କୁ ଆପଣ ପୋଷାକ ବୋଲି ଭାବିପାରନ୍ତି। ଭିନ୍ନ ପୋଷାକ ପିନ୍ଧିଲେ, ଦେଖାଯିବାର ରୂପ ମଧ୍ୟ ଭିନ୍ନ ହୁଏ।

```swift
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.tint)
```

imageScale ଏବଂ foregroundStyle ହେଉଛି Image view ର modifier। ଏମାନେ Image ର content ପରିବର୍ତ୍ତନ ନକରି, Image view କୁ ସଜାଇଥାନ୍ତି।

**1. imageScale**

```swift
.imageScale(.large)
```

ଏହା SF Symbols icon ର ଆକାର ନିୟନ୍ତ୍ରଣ କରିପାରେ:

* .small
* .medium
* .large

![Swift](../../RESOURCE/002_view11.png)

ଆମେ ଭିନ୍ନ option ବାଛିଦେଇ SF Symbols କୁ ଭିନ୍ନ ଆକାରରେ ଦେଖାଇପାରୁ।

**2. foregroundStyle**

```swift
.foregroundStyle(.tint)
```

foregroundStyle ଦ୍ୱାରା foreground color ନିୟନ୍ତ୍ରଣ କରାଯାଏ।

.tint ର ଅର୍ଥ ହେଉଛି ବର୍ତ୍ତମାନ environment ର accent color, ଯାହା default ଭାବେ iOS ରେ ନୀଳ ରଙ୍ଗ।

ଯଦି ଆମେ foreground color କୁ ଲାଲ୍ କରିବାକୁ ଚାହୁଁ:

```swift
.foregroundStyle(.red)
```

![Swift](../../RESOURCE/002_view5.png)

#### Text view

Text ହେଉଛି text view, ଯାହା string ଦେଖାଇବା ପାଇଁ ବ୍ୟବହୃତ ହୁଏ।

```swift
Text("Hello, world!")
```

ଉଦାହରଣ ସ୍ୱରୂପ, ମୋର ନାମ ଦେଖାଇବା:

```swift
Text("FangJunyu")
```

ଧ୍ୟାନ ଦିଅନ୍ତୁ: string କୁ ନିଶ୍ଚୟ "" double quote ଭିତରେ ଲେଖିବାକୁ ପଡିବ।

ଆପଣ ନିଜ ନାମ, ଫୋନ୍ ନମ୍ବର ଇତ୍ୟାଦି ଦେଖାଇ ଦେଖିପାରନ୍ତି।

#### padding ଧାର / ଅନ୍ତର

SwiftUI ରେ, padding ର ଅର୍ଥ ହେଉଛି view content ଏବଂ boundary ମଧ୍ୟରେ ଖାଲି ଅଞ୍ଚଳ ଯୋଡିବା। ଏହାକୁ “inner spacing（padding / content inset）” ବୋଲି କୁହାଯାଏ।

```swift
HStack {
    ...
}
.padding()
```

ଉପରୋକ୍ତ code ର ଅର୍ଥ ହେଉଛି HStack view କୁ system default padding ଯୋଡାଯାଇଛି।

**padding କ’ଣ?**

padding ର ଅର୍ଥ “view content ଏବଂ ତାହାର boundary ମଧ୍ୟରେ ଥିବା ଖାଲି ସ୍ଥାନ”।

ନିମ୍ନଲିଖିତ ଛବିରେ, ନୀଳ HStack ରେ padding ଦେବା ପରେ, ନୀଳ ଅଞ୍ଚଳ ଭିତରକୁ ସଙ୍କୁଚିଯାଇଥାଏ, ଦେଖିବାକୁ ଲାଗେ ଯେ “ଏକ ଚକ୍ର ଛୋଟ ହୋଇଗଲା”।

![Swift](../../RESOURCE/002_view6.png)

**Default padding**

padding() modifier default ଭାବେ system ଦ୍ୱାରା ସୁପାରିଶ୍ରୁତ standard spacing ବ୍ୟବହାର କରେ।

```swift
.padding()
```

ଭିନ୍ନ platform ଏବଂ context ରେ ଏହି value ଅଲ୍ପ ପରିବର୍ତ୍ତିତ ହୋଇପାରେ। ଉଦାହରଣ:

* iOS ରେ ସାଧାରଣତଃ ପ୍ରାୟ 16 pt।
* macOS କିମ୍ବା watchOS ରେ system standard spacing ଭିନ୍ନ ହୋଇପାରେ; ଏହା platform design guideline ଉପରେ ନିର୍ଭର କରେ।

**Custom padding**

ଆମେ view ପାଇଁ ଅଲଗା ଅଲଗା padding ମଧ୍ୟ ନିର୍ଦ୍ଧାରଣ କରିପାରୁ।

1. ଏକକ ଦିଗ ନିର୍ଦ୍ଧାରଣ

```swift
.padding(.top, 20)
.padding(.leading, 20)
.padding(.trailing, 20)
.padding(.bottom, 20)
```

ଦିଗ ଅର୍ଥ:

* .top: ଉପର ଧାର
* .bottom: ତଳ ଧାର
* .leading: ଆଗ ଦିଗର ଧାର
* .trailing: ପଛ ଦିଗର ଧାର

![Swift](../../RESOURCE/002_view12.png)

ଧ୍ୟାନ ଦିଅନ୍ତୁ: leading ଏବଂ trailing ଭାଷା ଦିଗ ଅନୁଯାୟୀ ସ୍ୱୟଂଚାଳିତ ଭାବେ ଅନୁକୂଳ ହୁଏ। ଉଦାହରଣ ସ୍ୱରୂପ Arabic（RTL）ପରିବେଶରେ ସେଗୁଡ଼ିକ ଆପେ ଆପେ ପଲଟିଯାଏ।

2. ଅନେକ ଦିଗ ନିର୍ଦ୍ଧାରଣ

```swift
.padding([.top, .leading], 20)
```

![Swift](../../RESOURCE/002_view13.png)

Array ବ୍ୟବହାର କରି ଏକାଧିକ ଦିଗ ଏକ ସାଥିରେ ଦିଆଯାଇପାରେ। Array ର ବିସ୍ତୃତ ବ୍ୟବହାର ପରବର୍ତ୍ତୀ ପାଠରେ ବୁଝାଯିବ; ଏଠାରେ କେବଳ ଏହି syntax ବିଷୟରେ ଜାଣିଲେ ହେବ।

3. Horizontal କିମ୍ବା vertical ଦିଗ ନିର୍ଦ୍ଧାରଣ

```swift
.padding(.horizontal, 20)
.padding(.vertical, 20)
```

ଏହା ନିମ୍ନଲିଖିତ ସହ ସମାନ:

```swift
.padding([.leading, .trailing], 20)
.padding([.top, .bottom], 20)
```

![Swift](../../RESOURCE/002_view14.png)

**padding ହଟାଇବା**

ଯଦି କୌଣସି padding ନ ଚାହୁଁ, .padding(0) ବ୍ୟବହାର କରି ହଟାଇଦିଆଯାଇପାରେ:

```swift
.padding(0)
```

କିମ୍ବା padding modifier କୁ ସିଧାସଳଖ ହଟାଇପାରନ୍ତି:

```swift
// .padding()
```

### 6. Preview preview କୋଡ୍

```swift
#Preview {
    ContentView()
}
```

ଏହି code ର ଅର୍ଥ ହେଉଛି Canvas ଭିତରେ ContentView ର preview ସୃଷ୍ଟି କରାଯାଉଛି।

ଧ୍ୟାନ ଦିଅନ୍ତୁ: #Preview ହେଉଛି Swift 5.9 / Xcode 15 ରେ ପରିଚିତ ନୂତନ syntax। ଏହାର ପୂର୍ବରୁ PreviewProvider structure ବ୍ୟବହାର ହୁଏଥିଲା।

**Preview କୁ comment କଲେ କ’ଣ ହେବ?**

ଯଦି Preview କୁ comment କରିଦିଅନ୍ତୁ:

```swift
// #Preview {
//    ContentView()
// }
```

ତେବେ Canvas ରେ ଆଉ render ହୋଇପାରୁଥିବା content ଦେଖାଯିବ ନାହିଁ।

![Swift](../../RESOURCE/002_xcode.png)

ଏହା ଦେଖାଏ ଯେ #Preview Canvas ର preview view କୁ ନିୟନ୍ତ୍ରଣ କରେ।

ଯେତେବେଳେ ଆମେ Xcode ରେ SwiftUI view preview କରିବାକୁ ଚାହୁଁ, ସେତେବେଳେ #Preview code ଯୋଡିବୁ। ଯଦି preview ଦରକାର ନାହିଁ, #Preview code କୁ comment କିମ୍ବା delete କରିପାରିବୁ।

## ସାରାଂଶ

ଯଦିଓ ContentView.swift ଫାଇଲ୍ ରେ ଅଧିକ code ନାହିଁ, କିନ୍ତୁ ବାସ୍ତବରେ ଏହା SwiftUI ର ଅନେକ ମୁଖ୍ୟ ଧାରଣାକୁ ଆବର୍ତ୍ତ କରେ। ଆରମ୍ଭିକ ଶିକ୍ଷାର୍ଥୀଙ୍କ ପାଇଁ ଏହି code ଅଜଣା ଲାଗିପାରେ, କିନ୍ତୁ ଏହାକୁ ଖଣ୍ଡ ଖଣ୍ଡ କରି ବୁଝିଲେ SwiftUI ବିଷୟରେ ପ୍ରାରମ୍ଭିକ ଧାରଣା ତିଆରି ହୁଏ।

ଏହି ପାଠର ବିଷୟବସ୍ତୁକୁ ମନେ ପକାଉଥିବାବେଳେ, ପ୍ରଥମେ ଆମେ comment // ବିଷୟରେ ଶିଖିଲୁ, ଯାହା ଦ୍ୱାରା code logic ବ୍ୟାଖ୍ୟା କରିବା କିମ୍ବା code କୁ ସାମୟିକ ଭାବରେ ବନ୍ଦ କରିବା ଯାଏ।

ତାପରେ, ଆମେ ବୁଝିଲୁ ଯେ SwiftUI ଫାଇଲ୍ ଭିତରେ ନିଶ୍ଚୟ SwiftUI framework import କରିବାକୁ ପଡେ:

```swift
import SwiftUI
```

ଯଦି framework import କରାଯାଇନାହିଁ, compiler View ପରି type କୁ ଚିହ୍ନିପାରିବ ନାହିଁ।

ତାପରେ, ଆମେ SwiftUI view ର ମୌଳିକ structure କୁ ଚିହ୍ନିଲୁ:

```swift
struct ContentView: View {
    var body: some View {
        ...
    }
}
```

ଏଥିରେ ContentView ହେଉଛି view ର ନାମ।

ଆମେ ତିନୋଟି ସାଧାରଣ layout container ମଧ୍ୟ ଶିଖିଲୁ: VStack（vertical layout）、HStack（horizontal layout）ଏବଂ ZStack（overlay layout）。

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ଏହି code ର ଅର୍ଥ ହେଉଛି ଗୋଟିଏ vertical layout container ଦେଖାଇବା, ଯାହାର ଭିତରେ ଗୋଟିଏ icon ଏବଂ ଗୋଟିଏ text ଅଛି।

Image ଦ୍ୱାରା SF Symbols icon ଦେଖାଯାଇପାରେ, ଏବଂ modifier ଦ୍ୱାରା icon ର ଆକାର ଓ ରଙ୍ଗ ନିୟନ୍ତ୍ରଣ କରାଯାଏ।

Text view ଦ୍ୱାରା ଟେକ୍ସ୍ଟ୍ ଦେଖାଯାଏ।

padding ହେଉଛି spacing, ଯାହା view ଚାରିପାଖରେ ଗୋଟିଏ transparent ଖାଲି ସ୍ଥାନ ଯୋଡେ।

ଶେଷରେ, #Preview preview view ବିଷୟରେ ମଧ୍ୟ ଆମେ ଜାଣିଲୁ, ଯାହା Canvas ରେ preview ଦେଖାଇପାରେ।

### ପାଠ ପରବର୍ତ୍ତୀ ଅଭ୍ୟାସ

ଆରମ୍ଭିକ ଶିକ୍ଷାର୍ଥୀଙ୍କ ପାଇଁ, ଏହି ପାଠର ବିଷୟବସ୍ତୁ ଟିକେ ଜଟିଳ ଲାଗିପାରେ। ଆମେ ଅଧିକ ଅଭ୍ୟାସ ଦ୍ୱାରା ବୁଝାପଡ଼ାକୁ ଆଉ ଗଭୀର କରିପାରିବୁ:

* SF Symbols ର icon ନାମ ପରିବର୍ତ୍ତନ କରନ୍ତୁ
* icon ର foreground color କୁ କଳା କରନ୍ତୁ
* VStack କୁ HStack କରନ୍ତୁ
* Image କିମ୍ବା Text କୁ comment କରି preview view ର ପରିବର୍ତ୍ତନ ଅବଲୋକନ କରନ୍ତୁ

### ଛୋଟ ଅତିରିକ୍ତ: Code Completion

କୋଡ୍ ଲେଖୁଥିବାବେଳେ, ଆପଣ ସମ୍ଭବତଃ ଧ୍ୟାନ ଦେଇଥିବେ ଯେ Xcode ସ୍ୱୟଂଚାଳିତ ଭାବେ available option ର ତାଲିକା ଦେଖାଏ।

ଉଦାହରଣ ସ୍ୱରୂପ, ଯେତେବେଳେ ଆମେ imageScale modifier କୁ ବଦଳାଉଛୁ:

```swift
.imageScale(.)
```

Xcode ସେତେବେଳେ available option ଦେଖାଇଦେଏ:

![Swift](../../RESOURCE/002_view10.png)

ଏହା code completion mechanism ର ଅଂଶ, ଯାହା type inference ଏବଂ enum member suggestion ଉପରେ ଆଧାରିତ। ଏହା input efficiency ବୃଦ୍ଧି କରେ ଏବଂ ଭୁଲ୍ କମାଇଦେଏ।

ପରବର୍ତ୍ତୀ ପାଠଗୁଡ଼ିକରେ, ଆମେ enum କୁ ଔପଚାରିକ ଭାବରେ ଶିଖିବୁ। ଏବେ ପାଇଁ କେବଳ ସରଳ ଧାରଣା ରଖିବା ଯଥେଷ୍ଟ।
