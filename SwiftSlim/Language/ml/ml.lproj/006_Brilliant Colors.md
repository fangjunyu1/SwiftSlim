# മനോഹരമായ നിറങ്ങൾ

ഈ പാഠത്തിൽ SwiftUI-യിലെ ചില സാധാരണ visual modifiers പഠിക്കും. അവയിൽ ഉൾപ്പെടുന്നത്:

- color
- foreground color
- background color
- offset
- opacity
- blur

ഇതിനൊപ്പം `Safe Area` (സുരക്ഷിത പ്രദേശം)യും പഠിക്കും.

ഈ modifiers views-ന്റെ visual appearance നിയന്ത്രിക്കാനും UI കൂടുതൽ വ്യക്തവും പാളികളുള്ളതുമായതാക്കാനും ഉപയോഗിക്കുന്നു.

## നിറങ്ങൾ

SwiftUI-ൽ text-ന്റെ color നിശ്ചയിക്കാം.

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`.blue` എന്നത് blue നിറം സൂചിപ്പിക്കുന്നു. ഇത് യാഥാർത്ഥ്യത്തിൽ `Color.blue` എന്നതിന്റെ ലളിതമായ രൂപമാണ് (type inference).

സാധാരണ colors:

```
.black
.green
.yellow
.pink
.gray
...
```

ഇവ എല്ലാം `Color`-ന്റെ static properties ആണ്.

![Color](../../RESOURCE/006_color.png)

`Color` ഒരു color type ആണെന്നും `.blue`, `.red` എന്നിവ അതിന്റെ നിർദ്ദിഷ്ട നിറങ്ങളാണെന്നും കരുതാം.

### `Color` view

SwiftUI-ൽ `Color` ഒരു view ആയും directly കാണിക്കാം.

```swift
Color.red
    .frame(width: 100, height:100)
    .cornerRadius(10)
```

![Color](../../RESOURCE/006_color5.png)

ഈ code `100×100` വലിപ്പമുള്ള ഒരു red square സൃഷ്ടിക്കും.

മുഴുവൻ screen-വും ഒരു നിറമായി കാണിക്കാനും കഴിയും:

```swift
struct ContentView: View {
    var body: some View {
        Color.red
    }
}
```

![Color](../../RESOURCE/006_color1.png)

Run ചെയ്താൽ red നിറം screen മുഴുവൻ നിറയ്ക്കുന്നില്ലെന്ന് കാണാം; iPhone-ന്റെ top, bottom ഭാഗങ്ങൾ ഇപ്പോഴും white ആണ്. ഇവിടെ `Safe Area` എന്ന ആശയം വരുന്നു.

## Safe Area

Content system elements-ാൽ മൂടപ്പെടാതിരിക്കാനായി system reserve ചെയ്യുന്ന പ്രദേശമാണ് `Safe Area`. ഇതിൽ ഉൾപ്പെടുന്നത്:

1. മുകളിലെ status bar (സമയം, battery)

2. താഴെയുള്ള Home indicator area

3. notch അല്ലെങ്കിൽ Dynamic Island പ്രദേശം

![Color](../../RESOURCE/006_color3.png)

SwiftUI default ആയി content-നെ safe area-ക്കുള്ളിൽ തന്നെ പരിമിതപ്പെടുത്തും. അതിനാൽ view screen edge വരെ നീളുകയില്ല.

### Safe Area അവഗണിക്കുക

Color screen മുഴുവൻ നിറയ്ക്കണമെങ്കിൽ `ignoresSafeArea` ഉപയോഗിക്കാം:

```swift
Color.red
    .ignoresSafeArea()
```

അല്ലെങ്കിൽ `edgesIgnoringSafeArea`:

```swift
Color.red
    .edgesIgnoringSafeArea(.all)
```

![Color](../../RESOURCE/006_color4.png)

ഇപ്പോൾ view മുഴുവൻ screen-ലേക്ക് നീളും.

ശ്രദ്ധിക്കുക: `edgesIgnoringSafeArea` പഴയ syntax ആണ്. iOS 14 മുതൽ `ignoresSafeArea` ആണ് ശുപാർശ ചെയ്യുന്നത്.

## Foreground color

### `foregroundStyle` modifier

മുൻ പാഠങ്ങളിൽ `foregroundStyle` ഉപയോഗിച്ച് color set ചെയ്യുന്നത് നാം പഠിച്ചിരുന്നു.

ഉദാഹരണത്തിന്:

```swift
Text("Fang Junyu")
    .foregroundStyle(.blue)
```

`foregroundStyle` ഒരു പുതിയ style system ആണ്; ഇത് color, gradient, material തുടങ്ങിയവ പിന്തുണയ്ക്കുന്നു.

![Color](../../RESOURCE/006_color2.png)

### `foregroundColor` modifier

`foregroundColor` ഉപയോഗിച്ചും color set ചെയ്യാം:

```swift
Text("Fang Junyu")
    .foregroundColor(.blue)
```

ഇതിന്റെ ഉപയോഗവും `foregroundStyle` പോലെയാണ്.

പുതിയ Xcode versions-ൽ, `foregroundColor` ഭാവിയിലെ iOS versions-ൽ deprecated ആകാൻ സാധ്യതയുണ്ടെന്ന് Xcode സൂചിപ്പിക്കും. അതിനാൽ ആദ്യം `foregroundStyle` ഉപയോഗിക്കുകയാണ് നല്ലത്.

## Background

ഒരു view-ന് background color ചേർക്കണമെങ്കിൽ `background` ഉപയോഗിക്കാം:

```swift
background(.red)
```

ഉദാഹരണത്തിന് text-ന് background ചേർക്കുക:

```swift
Text("FangJunyu.com")
    .background(.orange)
```

![Color](../../RESOURCE/006_color6.png)

Word, Chrome പോലെയുള്ള apps-ൽ text select ചെയ്യുമ്പോൾ ഇതുപോലെ background effect കാണാം.

![Color](../../RESOURCE/006_color16.png)

Background വലുതാക്കണമെങ്കിൽ `padding`-നൊപ്പം ഉപയോഗിക്കണം:

```swift
Text("FangJunyu.com")
    .padding(10)
    .background(Color.orange)
```

![Color](../../RESOURCE/006_color7.png)

ഇവിടെ ശ്രദ്ധിക്കേണ്ട ഒരു പ്രധാന നിയമം:

SwiftUI modifiers മുകളിൽ നിന്ന് താഴേക്ക് view build ചെയ്യുന്നു. പിന്നീടെഴുതുന്ന modifier, മുൻപുള്ള ഫലത്തിന്മേലാണ് പ്രവർത്തിക്കുന്നത്.

അതുകൊണ്ട്:

```swift
.padding()
.background()
```

ഇത് background, padding ചേർത്തശേഷമുള്ള view-നെ wrap ചെയ്യും എന്നർത്ഥം.

ക്രമം മറിച്ചാൽ:

```swift
Text("FangJunyu.com")
    .background(Color.orange)
    .padding(10)
```

![Color](../../RESOURCE/006_color6.png)

Background വലുതാകില്ല, കാരണം അത് പിന്നീടുള്ള padding-നെ wrap ചെയ്തിട്ടില്ല.

## ഉദാഹരണം - നാല് മൂലയുള്ള nut

ഇപ്പോൾ ഒരു ലളിതമായ four-corner nut view ഉണ്ടാക്കാം.

![Color](../../RESOURCE/006_color8.png)

ആദ്യം `50 × 50` വലിപ്പമുള്ള ഒരു white square സൃഷ്ടിക്കുക:

```swift
Color.white
    .frame(width: 50, height: 50)
```

അതിനെ circle ആക്കണമെങ്കിൽ `cornerRadius` ഉപയോഗിക്കാം:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
```

Corner radius width-height-ന്റെ പകുതി ആയാൽ അത് ഒരു circle ആകും.

ഇപ്പോൾ ഇതിന് blue background ചേർക്കാം:

```swift
Color.white
    .frame(width: 50, height: 50)
    .cornerRadius(25)
    .padding(20)
    .background(.blue)
```

![Color](../../RESOURCE/006_color8.png)

ഇവിടെ ചേർത്ത `padding` പുറത്തുള്ള പ്രദേശം വലുതാക്കും; `background` ആ പുറം പ്രദേശത്ത് blue നിറം വരയ്ക്കും.

ഇതോടെ ഒരു four-corner nut effect സൃഷ്ടിച്ചു.

### മറ്റൊരു സമീപനം

Background color ഉപയോഗിച്ച് മാത്രം four-corner nut ഉണ്ടാക്കുന്നതിന് പുറമെ `ZStack` ഉപയോഗിച്ചും ഇത് സൃഷ്ടിക്കാം.

മുൻപ് പഠിച്ചതുപോലെ `ZStack` overlay arrangement ചെയ്യുന്നു. Four-corner nut-നെ ഒരു circle ഉം rectangle ഉം overlay ആയി കാണിക്കുന്നതുപോലെ കരുതാം.

```swift
ZStack {
    Color.blue
        .frame(width: 70, height: 70)
    Color.white
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color8.png)

`ZStack` views-നെ ക്രമത്തിൽ overlay ചെയ്യും; പിന്നീടു ചേർക്കുന്ന view മുകളിലെ layer-ലാകും.

## ഉദാഹരണം - തമ്മിൽ overlap ചെയ്യുന്ന രണ്ട് വൃത്തങ്ങൾ

നിരവധി icons ലളിതമായ shapes overlay ചെയ്ത് രൂപപ്പെടുത്തിയവയാണ്, ഉദാഹരണത്തിന് overlap ചെയ്യുന്ന രണ്ട് circles.

![Color](../../RESOURCE/006_color14.png)

ആദ്യം രണ്ട് circles സൃഷ്ടിക്കാം:

```swift
Color.red
    .frame(width: 50, height:50)
    .cornerRadius(25)
Color.orange
    .frame(width: 50, height:50)
    .cornerRadius(25)
```

![Color](../../RESOURCE/006_color11.png)

രണ്ട് circles-ഉം overlap ആയി കാണിക്കേണ്ടതിനാൽ `ZStack` ഉപയോഗിക്കുന്നു:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color12.png)

ഇപ്പോൾ രണ്ടു ഒരേ വലിപ്പമുള്ള circles പൂർണ്ണമായി overlap ചെയ്തിരിക്കുന്നു.

ഇവ ഭാഗികമായി overlap ചെയ്യണമെങ്കിൽ, പൂർണ്ണമായും ഒന്നിന്മീതെ ഒന്ന് വരാതെ, `offset` ഉപയോഗിച്ച് സ്ഥാനം മാറ്റാം.

## Offset

`offset` view-ന്റെ drawing position മാത്രം മാറ്റും; parent view-ന്റെ layout calculation-നെ അത് ബാധിക്കില്ല.

ഉപയോഗം:

```swift
.offset(x:y:)
```

`x` horizontal direction-ലുള്ള മാറ്റം, `y` vertical direction-ലുള്ള മാറ്റം.

Positive values right / down ദിശയിലേക്കും negative values left / up ദിശയിലേക്കും മാറ്റും.

രണ്ട് circles ഭാഗികമായി overlap ചെയ്യാൻ `offset` ഉപയോഗിക്കുക:

```swift
ZStack {
    Color.red
        .frame(width: 50, height: 50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height: 50)
        .cornerRadius(25)
}
```

![Color](../../RESOURCE/006_color13.png)

Red circle layout-ൽ തന്റെ സ്ഥാനം മാറ്റുന്നില്ല; പക്ഷേ അതിന്റെ drawing position `25` points left-ലേക്ക് മാറുന്നു. അതിനാൽ രണ്ടു circles ഭാഗികമായി overlap ചെയ്യുന്ന visual effect ഉണ്ടാകുന്നു.

## Opacity

SwiftUI-ൽ `opacity` view-ന്റെ transparency നിശ്ചയിക്കാൻ ഉപയോഗിക്കുന്നു.

അടിസ്ഥാന ഉപയോഗം:

```swift
.opacity(0.5)
```

`opacity`-യുടെ range `0.0` മുതൽ `1.0` വരെയാണ്, ഇവിടെ:

- `0` എന്നത് പൂർണ്ണമായും transparent
- `1` എന്നത് opaque

Orange circle-ന്റെ transparency `opacity` ഉപയോഗിച്ച് മാറ്റാം:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x: -25)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
```

![Color](../../RESOURCE/006_color14.png)

Orange circle-ന്റെ `opacity` `0.8` ആക്കിയാൽ അതിന്റെ opacity `80%` ആകും. രണ്ടു circles overlap ചെയ്യുമ്പോൾ overlap ചെയ്യുന്ന പ്രദേശത്ത് color blending effect ഉണ്ടാകും.

## Blur

SwiftUI-ൽ `blur` ഉപയോഗിച്ച് blur effect നിശ്ചയിക്കാം:

```swift
.blur(radius:10)
```

`radius` blur-ന്റെ radius ആണ്. സംഖ്യ കൂടുതലായാൽ blur കൂടുതൽ വ്യക്തമായിരിക്കും.

രണ്ട് circles-ക്കും blur ചേർക്കാം:

```swift
ZStack {
    Color.red
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .offset(x:-35)
    Color.orange
        .frame(width: 50, height:50)
        .cornerRadius(25)
        .opacity(0.8)
}
.blur(radius:10)
```

![Color](../../RESOURCE/006_color15.png)

അവസാനം നാം രണ്ട് വളരെ blur ആയ circles കാണും.

## സംഗ്രഹം

ഈ പാഠം SwiftUI-യിലെ സാധാരണ visual modifiers ചുറ്റിപ്പറ്റിയാണ്. Modifiers ഉപയോഗിച്ച് views-ന്റെ color, position, visual effects എന്നിവ എങ്ങനെ നിയന്ത്രിക്കാമെന്നു പഠിച്ചു.

ഉദാഹരണങ്ങൾ വഴി വ്യത്യസ്ത visual modifiers UI-യിൽ യഥാർത്ഥത്തിൽ എങ്ങനെ പ്രവർത്തിക്കുന്നു എന്നും safe area എന്ന അറിവും മനസ്സിലാക്കി.

ഇവ വളരെ അടിസ്ഥാനപരമായ modifiers ആണ്. ഇവ വീണ്ടും വീണ്ടും പരിശീലിക്കുകയും ഉപയോഗിക്കുകയും ചെയ്യുന്നത് യഥാർത്ഥ development-ൽ UI effect കൂടുതൽ വ്യക്തമായി നിയന്ത്രിക്കാൻ സഹായിക്കും.

### പാഠാനന്തര അഭ്യാസം

- ഒരു ചിത്രത്തിന് transparency, blur effect ചേർക്കുക
- വ്യത്യസ്ത opacity ഉള്ള മൂന്ന് overlapping circles നിർമ്മിക്കുക
- safe area അവഗണിച്ച് screen മുഴുവൻ നിറക്കുന്ന ഒരു background image സൃഷ്ടിക്കുക
- `offset` ഉപയോഗിച്ച് ഒന്നിലധികം views-ന്റെ സ്ഥാനം ക്രമീകരിക്കുക

ഈ അഭ്യാസങ്ങളുടെ ലക്ഷ്യം API മനപ്പാഠമാക്കുക അല്ല; visual മാറ്റങ്ങളും layout behavior-വും തമ്മിലുള്ള ബന്ധം നിരീക്ഷിക്കുകയാണ്.
