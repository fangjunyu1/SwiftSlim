# ലേയൗട്ട്, ചിത്രങ്ങൾ, വാചകം

മുൻ പാഠത്തിൽ നാം `ContentView` code പഠിച്ചു:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
.padding()
```

ഈ പാഠത്തിൽ നാം SwiftUI-യുടെ default layout mechanism-വും, ചിത്രങ്ങളും വാചകവും എങ്ങനെ ഉപയോഗിക്കാമെന്നതും പഠിക്കും. മുൻ പാഠത്തെ അടിസ്ഥാനമാക്കി view-ന്റെ structure ഉം display രീതിയും കൂടുതൽ ആഴത്തിൽ മനസ്സിലാക്കും. ഈ അറിവുകൾ കൊണ്ട് അടിസ്ഥാന UI layouts നിർമ്മിക്കാൻ നമുക്ക് കഴിയും.

## SwiftUI-യുടെ default layout mechanism

`ContentView` preview ചെയ്യുമ്പോൾ icon ഉം text ഉം screen-ന്റെ മദ്ധ്യത്തിൽ കാണാം; മുകളിൽ നിന്ന് തുടങ്ങുന്ന രീതിയിലല്ല.

![Swift](../../RESOURCE/003_view.png)

Default ആയി `Stack` container-ന്റെ alignment `.center` ആയതിനാൽ, child views സാധാരണയായി centered ആയി കാണപ്പെടും.

### Alignment

Centered alignment എന്നത് alignment-ന്റെ ഒരു രൂപം മാത്രമാണ്. Left align അല്ലെങ്കിൽ right align വേണമെങ്കിൽ `alignment` ഉപയോഗിച്ച് view-ന്റെ alignment നിയന്ത്രിക്കണം.

```swift
alignment
```

SwiftUI-ൽ alignment സാധാരണയായി രണ്ട് സാഹചര്യങ്ങളിൽ കാണാം:

**1. Stack container-ന്റെ alignment parameter**

ഉദാഹരണത്തിന്, `ContentView`-ലുള്ള icon ഉം text ഉം left align ചെയ്യുക:

```swift
VStack(alignment: .leading) {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Text("Hello, world!")
}
```

![Swift](../../RESOURCE/003_alignment.png)

`VStack`-ലെ `alignment` horizontal direction-ലെ alignment നിയന്ത്രിക്കുന്നു.

Alignment options:

```swift
VStack(alignment: .leading)
VStack(alignment: .center)
VStack(alignment: .trailing)
```

![Swift](../../RESOURCE/003_alignment1.png)

`HStack` horizontal arrangement ആണ്; അതിൽ `alignment` vertical direction-ലാണ് ബാധകമാകുന്നത്:

```swift
HStack(alignment: .top)
HStack(alignment: .center)
HStack(alignment: .bottom)
```

![Swift](../../RESOURCE/003_alignment2.png)

`ZStack` overlay arrangement ആണ്; അതിൽ `alignment` horizontal, vertical ഇരുവിധമായും നിയന്ത്രിക്കാം:

```swift
ZStack(alignment: .leading)
ZStack(alignment: .trailing)
ZStack(alignment: .top)
ZStack(alignment: .topLeading)
ZStack(alignment: .topTrailing)
ZStack(alignment: .center)
ZStack(alignment: .bottom)
ZStack(alignment: .bottomLeading)
ZStack(alignment: .bottomTrailing)
```

`alignment` explicit ആയി നിശ്ചയിക്കാത്ത പക്ഷം `VStack`, `HStack`, `ZStack` എല്ലാം default ആയി `.center` ഉപയോഗിക്കും.

**2. frame-ന്റെ ഉള്ളിലെ alignment**

```swift
Text("Hello")
    .frame(width: 200, alignment: .leading)
```

`frame` നൽകുന്ന size view-യുടെ സ്വന്തം size-നെക്കാൾ വലുതാകുമ്പോൾ, view `frame`-ന്റെ ഉള്ളിൽ എവിടെ position ചെയ്യണം എന്ന് `alignment` തീരുമാനിക്കുന്നു. `frame`-ന്റെ വിശദമായ ഉപയോഗം പിന്നീടു പഠിക്കും; ഇപ്പോൾ ഒന്ന് പരിചയപ്പെടുക മതി.

### Spacerയും space allocation mechanism-ഉം

`alignment` ഉപയോഗിച്ച് views horizontal അല്ലെങ്കിൽ vertical direction-ൽ ക്രമീകരിക്കാം. എന്നാൽ text ഉം image ഉം രണ്ട് അറ്റങ്ങളിൽ കാണിക്കണമെങ്കിൽ alignment മാത്രം മതി വരില്ല.

ഉദാഹരണത്തിന്, [NHK](https://www3.nhk.or.jp/nhkworld/zh/news/) website-ന്റെ top view പോലൊരു layout വേണം എന്ന് കരുതുക: ഇടത് വശത്ത് NHK logo, വലത് വശത്ത് menu icon.

![Swift](../../RESOURCE/003_alignment3.png)

`alignment` മാത്രം ഉപയോഗിച്ചാൽ രണ്ട് icons-ഉം ഒരേയൊരു വശത്ത് മാത്രം കൂടും. അവയെ ഇടത്തും വലത്തും വേർതിരിച്ച് വിതരണം ചെയ്യാൻ `Spacer` ഉപയോഗിച്ച് ശേഷിക്കുന്ന സ്ഥലം പങ്കിടണം.

`Spacer` എന്നത് layout-ിന് വേണ്ടി ഉപയോഗിക്കുന്ന ഒരു flexible view ആണ്; ഇത് ബാക്കിയുള്ള space സ്വയം നിറക്കും.

ഉപയോഗം:

```swift
Spacer()
```

ഉദാഹരണത്തിന്:

```swift
VStack {
    Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
    Spacer()
    Text("Hello, world!")
}
```

`Image`-നും `Text`-നും ഇടയിൽ `Spacer` ചേർത്താൽ, ശേഷിക്കുന്ന സ്ഥലം `Spacer` നിറക്കും; അതുവഴി `Image` മുകളിൽക്കും `Text` താഴേക്കും നീങ്ങും.

![Swift](../../RESOURCE/003_view1.png)

ഒന്നിലധികം `Spacer` ഉണ്ടെങ്കിൽ:

```swift
VStack {
    Text("Hello, world!")
    Spacer()
    Text("FangJunyu")
    Spacer()
    Text("fangjunyu.com")
    Spacer()
}
```

ശേഷിക്കുന്ന സ്ഥലം എല്ലാം `Spacer`-കൾക്കിടയിൽ സമമായി വിഭജിക്കപ്പെടും.

![Swift](../../RESOURCE/003_spacer.png)

## Image-ന്റെ displayയും size control-വും

`Image` view പ്രധാനമായും ചിത്രങ്ങൾ കാണിക്കാൻ ഉപയോഗിക്കുന്നു. മുൻ പാഠത്തിൽ പഠിച്ച SF Symbols icon എന്നത് `Image`-ന്റെ ഉപയോഗങ്ങളിൽ ഒന്ന് മാത്രമാണ്.

ഉപയോഗം:

```swift
Image("imageName")
```

`Image`-യുടെ quotes ഉള്ളിലെത് image name ആണ്; file extension എഴുതേണ്ടതില്ല.

### ചിത്രം കാണിക്കൽ

ആദ്യം ഒരു ചിത്രം തയ്യാറാക്കാം.

![Swift](../../RESOURCE/003_img.jpg)

Xcode-ൽ `Assets` resource folder തിരഞ്ഞെടുക്കി ചിത്രം അതിലേക്ക് drag ചെയ്യുക.

![Swift](../../RESOURCE/003_img1.png)

`ContentView`-ൽ `Image` ഉപയോഗിച്ച് ചിത്രം കാണിക്കുക:

```swift
struct ContentView: View {
    var body: some View {
        Image("004_img")
    }
}
```

![Swift](../../RESOURCE/003_img2.png)

ശ്രദ്ധിക്കുക: SwiftUI-യിലെ `Image` GIF animation play ചെയ്യില്ല; static frame മാത്രമേ കാണിക്കൂ.

### ചിത്രത്തിന്റെ size നിയന്ത്രിക്കുക

SwiftUI-ൽ `Image` default ആയി ചിത്രത്തിന്റെ original size-ലാണ് കാണിക്കുന്നത്. അതിന്റെ size മാറ്റണമെങ്കിൽ ആദ്യം `resizable` ഉപയോഗിച്ച് image scalable ആക്കണം, പിന്നെ `frame` ഉപയോഗിച്ച് layout size നിശ്ചയിക്കണം.

```swift
Image("image")
    .resizable()
    .frame(width: 200, height: 200)
```

### `resizable` modifier

`resizable` modifier ചിത്രത്തെ layout-ൽ scale ചെയ്യാൻ അനുവദിക്കുന്നു; original size-ൽ സ്ഥിരപ്പെടുത്താതെ.

```swift
.resizable()
```

`resizable()` ചേർത്താൽ മാത്രമേ `frame` യഥാർത്ഥത്തിൽ ചിത്രത്തിന്റെ display size മാറ്റൂ.

`resizable` ഒഴിവാക്കിയാൽ:

```swift
Image("image")
    .frame(width: 50, height: 50)
```

`frame` image-ന് layout space മാത്രം നൽകും; ചിത്രത്തിന്റെ സ്വന്തം വലിപ്പം മാറുകയില്ല.

### `frame` modifier

`frame(width:height)` view-ന്റെ width, height നിർണ്ണയിക്കാൻ ഉപയോഗിക്കുന്നു.

അടിസ്ഥാന ഉപയോഗം:

```swift
.frame(width: 10,height: 10)
```

ഉദാഹരണത്തിന്, ഒരു ചിത്രം width `300`, height `100` ഉള്ള rectangle ആക്കുക.


```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 100)
```

![Swift](../../RESOURCE/003_img3.png)

Width അല്ലെങ്കിൽ height ഒറ്റയ്ക്ക് നിശ്ചയിക്കാനും കഴിയും:

```swift
.frame(width: 200)
.frame(height: 100)
```

`resizable + frame` എന്ന combination ഉപയോഗിച്ച് UI-യിൽ ചിത്രത്തിന്റെ size വളരെ flexible ആയി നിയന്ത്രിക്കാം, അതേ സമയം scale ചെയ്യാനുള്ള കഴിവും നിലനിർത്താം.

### Scale ratio: `scaledToFit`യും `scaledToFill`യും

`frame` ഉപയോഗിച്ച് width, height ratio വ്യത്യസ്തമായി നിശ്ചയിച്ചാൽ ചിത്രം stretch ആയി distort ആകാം.

ചിത്രത്തിന്റെ original ratio നിലനിർത്തി ലഭ്യമായ layout space-ിലേക്ക് അത് ഒതുക്കണമെങ്കിൽ `scaledToFit` അല്ലെങ്കിൽ `scaledToFill` ഉപയോഗിക്കാം.

**scaledToFit**

`scaledToFit` ചിത്രത്തിന്റെ original aspect ratio നിലനിർത്തി, മുഴുവൻ ചിത്രം ലഭ്യമായ space-ൽ fit ചെയ്യാൻ scale ചെയ്യും; image crop ആവില്ല:

```swift
.scaledToFit()
```

അല്ലെങ്കിൽ

```swift
.aspectRatio(contentMode: .fit)
```

ചിത്രം distort ആകരുതെന്നും, മുഴുവൻ ചിത്രം മുഴുവൻ കാണിക്കണമെന്നും ആഗ്രഹിക്കുന്ന സാഹചര്യങ്ങളിൽ ഇത് ഏറ്റവും അനുയോജ്യമാണ്.

ഓരോ ചിത്രത്തിനും ഒരേ width, height നിശ്ചയിച്ചാൽ stretch ആവുന്നത് സ്വാഭാവികമാണ്.

ഉദാഹരണത്തിന്:

```swift
Image("image")
    .resizable()
    .frame(width: 300, height: 200)
```

Scale ratio set ചെയ്യാത്തപ്പോൾ, ചിത്രം അതിന്റെ original proportion-ൽ കാണിക്കാൻ കഴിയില്ല.

![Swift](../../RESOURCE/003_img4.png)

`scaledToFit` ഉപയോഗിച്ചാൽ ചിത്രം original ratio നിലനിർത്തും.

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 300, height: 200)
```

![Swift](../../RESOURCE/003_img5.png)

**scaledToFill**

`scaledToFill`-നും aspect ratio നിലനിർത്താം, പക്ഷേ ഇത് ലഭ്യമായ മുഴുവൻ സ്ഥലം നിറക്കും; ratio ഒത്തില്ലെങ്കിൽ പുറത്തേക്ക് പോകുന്ന ഭാഗം crop ചെയ്യപ്പെടും:

```swift
.scaledToFill()
```

അല്ലെങ്കിൽ

```swift
.aspectRatio(contentMode: .fill)
```

ഇത് background image അല്ലെങ്കിൽ banner പോലുള്ള, മുഴുവൻ area cover ചെയ്യേണ്ട സാഹചര്യങ്ങൾക്ക് അനുയോജ്യമാണ്.

**ഇരുവരുടെയും വ്യത്യാസം**

![Swift](../../RESOURCE/003_img6.png)

## Text

SwiftUI-ൽ `Text` വാചകം കാണിക്കാൻ ഉപയോഗിക്കുന്നു.

അടിസ്ഥാന ഉപയോഗം:

```swift
Text("FangJunyu")
```

മുൻ പാഠത്തിൽ `Text` പഠിച്ചു. ഈ പാഠത്തിൽ font size, font weight എന്നിവ എങ്ങനെ നിയന്ത്രിക്കാം എന്ന് കൂടുതൽ പഠിക്കും; അതുവഴി text കൂടുതൽ expressive ആക്കാം.

### Font size

`font` modifier ഉപയോഗിച്ച് text size നിയന്ത്രിക്കാം:

```swift
.font(.title)
```

ഉദാഹരണത്തിന്:

```swift
Text("FangJunyu")
    .font(.largeTitle)
Text("FangJunyu")
    .font(.callout)
```

![Swift](../../RESOURCE/003_txt.png)

സാധാരണ font sizes (വലുതിൽ നിന്ന് ചെറുതിലേക്ക്):

```
.largeTitle
.title
.title2
.title3
.headline
.body
.subheadline
.callout
.footnote
.caption
.caption2
```

### Font weight

Text bold ആക്കണമെങ്കിൽ `fontWeight` modifier ഉപയോഗിക്കാം:

```swift
.fontWeight(.bold)
```

ഉദാഹരണത്തിന്:

```swift
Text("FangJunyu")
    .font(.title)
    .fontWeight(.bold)
Text("FangJunyu")
    .font(.title)
```

![Swift](../../RESOURCE/003_txt1.png)

സാധാരണ font weights (ചെറുതിൽ നിന്ന് കട്ടിയിലേക്ക്):

```
.ultraLight
.thin
.light
.regular
.medium
.semibold
.bold
.heavy
.black
```

`font` size നിയന്ത്രിക്കുന്നു; `fontWeight` thickness നിയന്ത്രിക്കുന്നു. ഇവ രണ്ടും ചേർത്ത് ഉപയോഗിച്ച് text-ന്റെ expression കൂടുതൽ സമ്പന്നമാക്കാം.

## സംഗ്രഹവും പരിശീലനവും

ഇപ്പോൾ വരെ നാം SwiftUI-യുടെ default layout, `Spacer`, `Image`, `Text` പോലുള്ള അടിസ്ഥാന അറിവുകൾ പഠിച്ചു. ഈ അറിവുകൾ ചില ലളിതമായ views നിർമ്മിക്കാൻ മതിയാകും.

ഉദാഹരണത്തിന്: [Google](https://www.google.com/)

![Swift](../../RESOURCE/003_google.png)

Google-ന്റെ interface വളരെ clean ആണ്. അതിൽ ചിത്രങ്ങളും വാചകവും ഉണ്ട്. SwiftUI-യുടെ ദൃഷ്ടികോണത്തിൽ നിന്ന് അതിന്റെ structure ഇങ്ങനെ വിശകലനം ചെയ്യാം:

1. മുഴുവൻ interface-നെ മൂന്ന് ഭാഗങ്ങളാക്കി കാണാം: Google logo, search box, hint text. ഇവ `VStack` ഉപയോഗിച്ച് vertical ആയി ക്രമീകരിക്കാം.
2. Google logo ഒരു image ആണ്; അതിനാൽ `Image` ഉപയോഗിച്ച് കാണിക്കാം.
3. Search box-ൽ input field ഉം icon ഉം ഉണ്ട്. Input field ഭാഗം ഇപ്പോൾ അവഗണിച്ചാൽ search icon `Image` ഉപയോഗിച്ച് കാണിക്കാം.
4. Hint text `Text` ഉപയോഗിച്ച് കാണിക്കാം. Text-ന്റെ horizontal arrangement-ക്ക് `HStack` ഉപയോഗിക്കാം; text color `foregroundStyle` ഉപയോഗിച്ച് നിയന്ത്രിക്കാം.

ഈ അറിവുകൾ ഉപയോഗിച്ച് പരിശീലനം നടത്തിയാൽ, ചില ലളിതമായ views നമുക്ക് ഉണ്ടാക്കാം. അതുവഴി `Image`, `Text` views ഉം അവയുടെ modifiers ഉം കൂടുതൽ നന്നായി മനസ്സിലാക്കാനും പ്രായോഗികമായി ഉപയോഗിക്കാനും കഴിയും.
